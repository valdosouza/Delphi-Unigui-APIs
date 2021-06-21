object Main: TMain
  Left = 271
  Top = 114
  ActiveControl = SessionIdList
  Caption = 'API de Dados'
  ClientHeight = 249
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    478
    249)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 162
    Top = 195
    Width = 20
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'Port'
    ExplicitTop = 383
  end
  object gg_processa: TGauge
    Left = 0
    Top = 222
    Width = 478
    Height = 27
    Align = alBottom
    Progress = 0
    ExplicitTop = 183
    ExplicitWidth = 247
  end
  object Label3: TLabel
    Left = 8
    Top = 7
    Width = 74
    Height = 13
    Caption = 'Sess'#245'es ATivas'
  end
  object Label2: TLabel
    Left = 255
    Top = 8
    Width = 88
    Height = 13
    Caption = 'Lista de Conex'#245'es'
  end
  object ButtonStart: TButton
    Left = 0
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Start'
    TabOrder = 0
    OnClick = ButtonStartClick
    ExplicitTop = 340
  end
  object ButtonStop: TButton
    Left = 81
    Top = 191
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Stop'
    TabOrder = 1
    OnClick = ButtonStopClick
    ExplicitTop = 340
  end
  object EditPort: TEdit
    Left = 188
    Top = 196
    Width = 121
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 2
    Text = '223'
    ExplicitTop = 345
  end
  object Btn_Processa: TButton
    Left = 0
    Top = 413
    Width = 75
    Height = 25
    Caption = 'Processa'
    TabOrder = 3
    Visible = False
  end
  object SessionIdList: TListBox
    Left = 8
    Top = 26
    Width = 241
    Height = 152
    ItemHeight = 13
    TabOrder = 4
  end
  object ListaConexoes: TListBox
    Left = 252
    Top = 26
    Width = 201
    Height = 152
    ItemHeight = 13
    TabOrder = 5
  end
  object brn_Listar_connection: TButton
    Left = 362
    Top = -2
    Width = 90
    Height = 22
    Caption = 'Listar'
    TabOrder = 6
    OnClick = brn_Listar_connectionClick
  end
  object btn_Lista_session: TButton
    Left = 159
    Top = -2
    Width = 90
    Height = 22
    Caption = 'Listar'
    TabOrder = 7
    OnClick = btn_Lista_sessionClick
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 320
    Top = 56
  end
  object ACBrValidador1: TACBrValidador
    IgnorarChar = './-'
    Left = 408
    Top = 40
  end
  object ApplicationEvents2: TApplicationEvents
    Left = 384
    Top = 120
  end
end
