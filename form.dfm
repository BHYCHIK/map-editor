object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'LandscapeEditor'
  ClientHeight = 554
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object SettingsPanel: TGroupBox
    Left = 0
    Top = 0
    Width = 145
    Height = 554
    Align = alLeft
    Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077
    TabOrder = 0
    object lblRadius: TLabel
      Left = 32
      Top = 21
      Width = 68
      Height = 13
      Caption = #1056#1072#1076#1080#1091#1089' '#1082#1080#1089#1090#1080
    end
    object lblPower: TLabel
      Left = 32
      Top = 69
      Width = 57
      Height = 13
      Caption = #1057#1080#1083#1072' '#1082#1080#1089#1090#1080
    end
    object lblGradient: TLabel
      Left = 29
      Top = 117
      Width = 81
      Height = 13
      Caption = #1043#1088#1072#1076#1080#1077#1085#1090' '#1082#1080#1089#1090#1080
    end
    object seRadius: TSpinEdit
      Left = 18
      Top = 41
      Width = 121
      Height = 22
      MaxValue = 100
      MinValue = 1
      TabOrder = 0
      Value = 10
    end
    object sePower: TSpinEdit
      Left = 18
      Top = 89
      Width = 121
      Height = 22
      MaxValue = 255
      MinValue = -255
      TabOrder = 1
      Value = 0
    end
    object seGradient: TSpinEdit
      Left = 18
      Top = 136
      Width = 121
      Height = 22
      MaxValue = 255
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
  end
  object ScrollBox1: TScrollBox
    Left = 145
    Top = 0
    Width = 581
    Height = 554
    Align = alClient
    TabOrder = 1
    object pbMap: TPaintBox
      Left = 0
      Top = 0
      Width = 577
      Height = 550
      Align = alClient
      ExplicitLeft = 528
      ExplicitTop = 264
      ExplicitWidth = 105
      ExplicitHeight = 105
    end
  end
  object mmMenu: TMainMenu
    Left = 672
    Top = 320
    object mmFile: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object mmNew: TMenuItem
        Caption = #1057#1086'&'#1079#1076#1072#1090#1100
      end
      object mmSave: TMenuItem
        Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object mmOpen: TMenuItem
        Caption = '&'#1054#1090#1082#1088#1099#1090#1100
      end
      object mmExit: TMenuItem
        Caption = #1042'&'#1099#1093#1086#1076
      end
    end
  end
  object odOpenMap: TOpenDialog
    DefaultExt = '*.rhmr'
    Filter = #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1072#1103' '#1082#1072#1088#1090#1072' '#1074#1099#1089#1086#1090'|*.rhmr'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 544
    Top = 320
  end
  object sdSaveRawFile: TSaveDialog
    DefaultExt = '*.rhmr'
    Filter = #1053#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1072#1103' '#1082#1072#1088#1090#1072' '#1074#1099#1089#1086#1090'|*.rhmr'
    Left = 560
    Top = 400
  end
end
