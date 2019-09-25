object ChangesComboBoxExt: TChangesComboBoxExt
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ChangeComboBoxExt'
  ClientHeight = 300
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 159
    Top = 38
    Width = 133
    Height = 16
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 136
    Width = 124
    Height = 16
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object MemoComboBox: TMemo
    Left = 32
    Top = 24
    Width = 105
    Height = 233
    TabOrder = 2
  end
  object BtnAdd: TButton
    Left = 334
    Top = 83
    Width = 75
    Height = 25
    Hint = #1053#1072#1078#1084#1080#1090#1077' '#1076#1083#1103' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1103
    Cancel = True
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = BtnAddClick
  end
  object EditAdd: TEdit
    Left = 334
    Top = 35
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnKeyPress = EditAddKeyPress
  end
  object EditDelete: TEdit
    Left = 334
    Top = 133
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnKeyPress = EditDeleteKeyPress
  end
  object BtnDelete: TButton
    Left = 334
    Top = 184
    Width = 75
    Height = 25
    Caption = #1055#1086#1077#1093#1072#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = BtnDeleteClick
  end
  object BtnReset: TButton
    Left = 168
    Top = 232
    Width = 70
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = BtnResetClick
  end
  object BtnApply: TButton
    Left = 334
    Top = 232
    Width = 99
    Height = 41
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1080#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    WordWrap = True
    OnClick = BtnApplyClick
  end
  object ButtonClear: TButton
    Left = 253
    Top = 232
    Width = 70
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = ButtonClearClick
  end
end