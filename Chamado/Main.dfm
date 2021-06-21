object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 527
  ClientWidth = 1001
  Caption = ''
  OnShow = UniFormShow
  BorderStyle = bsNone
  WindowState = wsMaximized
  FormStyle = fsMDIForm
  OldCreateOrder = False
  BorderIcons = []
  Script.Strings = (
    'function bunload(){'
    'dontleave="Voc'#234' tem certeza? O programa ser'#225' fechado!";'
    'return dontleave;'
    '};'
    'function ounload(){'
    'ajaxRequest(MainForm.window, '#39'SessionClosed'#39', [] );'
    '};')
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_body: TUniPanel
    Left = 0
    Top = 0
    Width = 1001
    Height = 527
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object pnl_Top: TUniPanel
      Left = 0
      Top = 0
      Width = 1001
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      Color = clActiveCaption
      object lb_email_usuario: TUniLabel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 492
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Nome do Usu'#225'rio :'
        Align = alLeft
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -19
        TabOrder = 1
      end
      object Lb_NomeEmpresa: TUniLabel
        AlignWithMargins = True
        Left = 503
        Top = 5
        Width = 304
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Nome da Empresa'
        Align = alClient
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -19
        TabOrder = 2
      end
      object Lb_data: TUniLabel
        AlignWithMargins = True
        Left = 813
        Top = 5
        Width = 183
        Height = 23
        Hint = ''
        AutoSize = False
        Caption = 'Data : 01/01/2019'
        Align = alRight
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -19
        TabOrder = 3
      end
    end
    object pg_Principal: TUniPageControl
      Left = 0
      Top = 97
      Width = 1001
      Height = 430
      Hint = ''
      ActivePage = tbs_called_list
      Align = alClient
      TabOrder = 2
      object tbs_called_list: TUniTabSheet
        Hint = ''
        Caption = 'Lista de Chamados'
      end
    end
    object pnl_modules: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 36
      Width = 995
      Height = 58
      Hint = ''
      Align = alTop
      TabOrder = 3
      BorderStyle = ubsFrameRaised
      Caption = ''
      Collapsed = True
      object Sb_called_open: TUniSpeedButton
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 125
        Height = 48
        Hint = ''
        Caption = 'Abrir Chamado'
        Align = alLeft
        ParentColor = False
        Color = clWindow
        TabOrder = 1
        OnClick = Sb_called_openClick
      end
      object Sb_Close: TUniSpeedButton
        AlignWithMargins = True
        Left = 865
        Top = 5
        Width = 125
        Height = 48
        Hint = ''
        Caption = 'Fechar Sistema'
        Align = alRight
        ParentColor = False
        Color = clWindow
        TabOrder = 2
        OnClick = Sb_CloseClick
      end
    end
  end
  object SQLConnect: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'HostName=localhost'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      'Port=8002'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=23.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverUnit=DBXDataSnap'
      'Filters={}')
    Left = 184
    Top = 32
  end
end
