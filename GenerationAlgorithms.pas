unit GenerationAlgorithms;

interface
uses
  Windows, Graphics, Math;

procedure SimpleGenerator(var map: TBitmap);
procedure HillGenerator(var map: TBitmap; const iters: Integer);

implementation
type
  HeightMap = array of array of Extended;

procedure SimpleFilter(var map: TBitmap);
var
  X, Y, Z: Integer;
begin
  for X := 0 to map.Width do
  begin
    for Y := 0 to map.Height do
    begin
      Z := map.Canvas.Pixels[x, y];
      Inc(Z, getRValue(map.Canvas.Pixels[x - 1, y - 1]));
      Inc(Z, getRValue(map.Canvas.Pixels[x - 1, y]));
      Inc(Z, getRValue(map.Canvas.Pixels[x - 1, y + 1]));
      Inc(Z, getRValue(map.Canvas.Pixels[x, y - 1]));
      Inc(Z, getRValue(map.Canvas.Pixels[x, y + 1]));
      Inc(Z, getRValue(map.Canvas.Pixels[x + 1, y - 1]));
      Inc(Z, getRValue(map.Canvas.Pixels[x + 1, y]));
      Inc(Z, getRValue(map.Canvas.Pixels[x + 1, y + 1]));
      z := Round(z / 9);
      map.Canvas.Pixels[x, y] := rgb(z, z, z);
    end;
  end;
end;

procedure SimpleGenerator(var map: TBitmap);
var
  X, Y, Z, I: Integer;
  Tmp: Integer;
begin
  Randomize;
  for X := 0 to map.Width do
  begin
    for Y := 0 to map.Height do
    begin
      Z := Random(255);
      map.Canvas.Pixels[x, y] := rgb(z, z, z);
    end;
  end;

  SimpleFilter(map);

  for I := 0 to Round(sqrt(map.Width * map.Height) * 10) do
  begin
    X := Random(map.Width + 1);
    Y := Random(map.Height + 1);
    Z := Random(256);
    map.Canvas.Pixels[x, y] := rgb(z, z, z);
  end;

  SimpleFilter(map);
end;

function HillAntiAliasing(var map: HeightMap; const x, y: Integer): Extended;
var
  Z: Extended;
begin
  Result := 0;
  Result := Result + map[x - 1, y - 1];
  Result := Result + map[x - 1, y];
  Result := Result + map[x - 1, y + 1];
  Result := Result + map[x, y - 1];
  Result := Result + map[x, y + 1];
  Result := Result + map[x + 1, y - 1];
  Result := Result + map[x + 1, y];
  Result := Result + map[x + 1, y + 1];
  Result := Result / 8;
end;

function HillUpping(var map: TBitmap; const iteration: Integer): HeightMap;
var
  I, X, Y, R, MaxR, Z: Integer;
  X1, Y1, error, delta: Integer;
begin
  Randomize;
  SetLength(Result, map.Width + 1, map.Height + 1);
  for I := 1 to iteration do
  begin
    X := Random(Round(map.Width * 1.1)) - Round(map.Width * 0.1);
    Y := Random(Round(map.Height * 1.1)) - Round(map.Height * 0.1);
    MaxR := Random(255) ;

    for R := 0 to MaxR do
    begin
      x1 := 0;
      y1 := R;
      delta := (2 - 2 * R);
      error := 0;
      while y1 >= 0 do
      begin
        if (X + x1 >= 0) and (X+X1 <= map.Width) and (Y + Y1 >= 0) and (Y+Y1 <= map.Height) then
          Result[X + x1, Y + y1] := GetRValue(map.Canvas.Pixels[X + x1, Y + y1]) + Sqrt(Sqr(MaxR) - Sqr(R));
        if (X + x1 >= 0) and (X+X1 <= map.Width) and (Y - Y1 >= 0) and (Y-Y1 <= map.Height) then
          Result[X + x1,Y - y1] := GetRValue(map.Canvas.Pixels[X + x1,Y - y1]) + Sqrt(Sqr(MaxR) - Sqr(R));
        if (X - x1 >= 0) and (X-X1 <= map.Width) and (Y + Y1 >= 0) and (Y+Y1 <= map.Height) then
          Result[X - x1,Y + y1] := GetRValue(map.Canvas.Pixels[X - x1,Y + y1]) + Sqrt(Sqr(MaxR) - Sqr(R));
        if (X - x1 >= 0) and (X-X1 <= map.Width) and (Y - Y1 >= 0) and (Y-Y1 <= map.Height) then
          Result[X - x1,Y - y1] := GetRValue(map.Canvas.Pixels[X - x1,Y - y1]) + Sqrt(Sqr(MaxR) - Sqr(R));

        error := 2 * (delta + y1) - 1;
        if ((delta < 0) and (error <= 0)) then
        begin
          inc(x1);
          delta := delta + (2 * x1 + 1);
          continue;
        end;
        error := 2 * (delta - x1) - 1;
        if ((delta > 0) and (error > 0)) then
        begin
          dec(y1);
          delta := delta + (1 - 2 * y1);
          continue;
        end;
        inc(x1);
        delta := delta + (2 * (x1 - y1));
        dec(y1);
      end;
    end;
  end;
                                     
end;

procedure HillCopy(var map: TBitmap; const tmpMap: HeightMap);
var
  X: Integer;
  Y: Integer;
  Z: Integer;
begin
  for X := 0 to map.Width do
  begin
    for Y := 0 to map.Height do
    begin
      Z := Round(tmpMap[x, y]);
      map.Canvas.Pixels[X, Y] := rgb(z, z, z);
    end;
  end;
end;

procedure HillNormalizationAndLiniaization(var map: HeightMap);
const
  criticalLevel = 25;
var
  Max, Min, Z: Extended;
  X, Y: Integer;
  aliased: boolean;
begin
  Max := Low(Integer);
  Min := High(Integer);
  for X := 0 to High(map) do
  begin
    for Y := 0 to High(map[x]) do
    begin
      if map[x, y] > max then
      begin
        max := map[x, y];
      end;
      if map[x, y] < min then
      begin
        min := map[x, y];
      end;
    end;
  end;

  for X := 0 to High(map) do
  begin
    for Y := 0 to High(map[x]) do
    begin
      if Max < 255 then      
        map[x, y] := sqrt((map[x, y] - min)/(max - min))*Max
      else
        map[x, y] := sqrt((map[x, y] - min)/(max - min))*255;
    end;
  end;

  aliased := true;
  while aliased do
  begin
    for X := 1 to High(map) - 1 do
    begin
      for Y := 1 to High(map[0]) - 1 do
      begin
        while true do
        begin
          aliased := false;
          if (map[x - 1, y - 1] - map[x, y] > criticalLevel)then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x - 1, y] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x - 1, y + 1] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x, y - 1] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x, y + 1] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x + 1, y - 1] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x + 1, y] - map[x, y] > criticalLevel)then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          if (map[x + 1, y + 1] - map[x, y] > criticalLevel) then
          begin
            aliased := true;
            map[x, y] := HillAntiAliasing(map, x, y);
            break;
          end;
          break;		    
        end;
      end;
    end; 
  end;
end;

procedure HillGenerator(var map: TBitmap; const iters: Integer);
var
  X, Y, Z: Integer;
  tmpMap: HeightMap;
begin
  if (map.Width = 0) and (map.Height = 0) then
    exit;

  tmpMap := HillUpping(map, iters);
  HillNormalizationAndLiniaization(tmpMap);
  HillCopy(map, tmpMap);
end;

end.