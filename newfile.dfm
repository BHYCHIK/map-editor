object NewMapForm: TNewMapForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1082#1072#1088#1090#1091
  ClientHeight = 139
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblLength: TLabel
    Left = 72
    Top = 27
    Width = 36
    Height = 13
    Caption = #1044#1083#1080#1085#1072':'
  end
  object lblWidth: TLabel
    Left = 64
    Top = 64
    Width = 44
    Height = 13
    Caption = #1064#1080#1088#1080#1085#1072':'
  end
  object btOK: TButton
    Left = 64
    Top = 106
    Width = 75
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100
    ModalResult = 1
    TabOrder = 0
  end
  object btCancel: TButton
    Left = 216
    Top = 106
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object seLength: TSpinEdit
    Left = 128
    Top = 24
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object seWidth: TSpinEdit
    Left = 128
    Top = 61
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
end
