object Main: TMain
  Left = 271
  Top = 114
  Caption = 'API - Auth'
  ClientHeight = 124
  ClientWidth = 210
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 20
    Height = 13
    Caption = 'Port'
  end
  object btn_inicia: TButton
    Left = 24
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btn_iniciaClick
  end
  object btn_para: TButton
    Left = 105
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Parar'
    TabOrder = 1
    OnClick = btn_paraClick
  end
  object EditPort: TEdit
    Left = 24
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '224'
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 168
    Top = 32
  end
end
