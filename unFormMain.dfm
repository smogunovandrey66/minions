object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'Me want banana!'
  ClientHeight = 306
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object scrlbxMain: TScrollBox
    Left = 0
    Top = 121
    Width = 613
    Height = 185
    Align = alClient
    TabOrder = 0
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 121
    Align = alTop
    TabOrder = 1
    DesignSize = (
      613
      121)
    object lblCapacityCart: TLabel
      Left = 35
      Top = 43
      Width = 41
      Height = 13
      Caption = #1025#1084#1082#1086#1089#1090#1100
    end
    object lblCount: TLabel
      Left = 16
      Top = 8
      Width = 60
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object lblTotalPurchase: TLabel
      Left = 280
      Top = 102
      Width = 6
      Height = 13
      Caption = '0'
    end
    object edtCapacityCart: TEdit
      Left = 82
      Top = 40
      Width = 78
      Height = 21
      TabOrder = 0
      Text = '100'
    end
    object edtCount: TEdit
      Left = 82
      Top = 5
      Width = 78
      Height = 21
      TabOrder = 1
      Text = '5'
    end
    object pbCommonProgress: TProgressBar
      Left = 16
      Top = 79
      Width = 580
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Position = 50
      TabOrder = 2
    end
    object btnStart: TButton
      Left = 280
      Top = 8
      Width = 149
      Height = 53
      Caption = #1047#1072#1090#1072#1088#1080#1084#1089#1103')'
      TabOrder = 3
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 464
      Top = 8
      Width = 145
      Height = 53
      Caption = #1044#1091#1084#1072#1102', '#1093#1074#1072#1090#1080#1090'!'
      Enabled = False
      TabOrder = 4
      OnClick = btnStopClick
    end
    object chkGoHome: TCheckBox
      Left = 166
      Top = 10
      Width = 97
      Height = 50
      Caption = #1056#1072#1093#1086#1076#1080#1090#1100#1089#1103' '#1087#1086' '#1076#1086#1084#1072#1084' ('#1082#1086#1075#1076#1072' '#1079#1072#1082#1086#1085#1095#1080#1084')'
      Checked = True
      State = cbChecked
      TabOrder = 5
      WordWrap = True
    end
  end
end
