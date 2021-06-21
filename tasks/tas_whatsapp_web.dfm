inherited TasWhatsappWeb: TTasWhatsappWeb
  ClientHeight = 535
  ClientWidth = 1166
  Caption = 'WhatsApp - Web - Setes'
  OnDestroy = UniFormDestroy
  ExplicitWidth = 1182
  ExplicitHeight = 594
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_contatos: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 289
    Height = 535
    Hint = ''
    Align = alLeft
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Title = 'Lista de Contatos'
    Caption = ''
    object Scb_Modules: TUniScrollBox
      Left = 2
      Top = 47
      Width = 285
      Height = 486
      Hint = ''
      Align = alClient
      TabOrder = 1
      object dbg_contact: TUniDBGrid
        Left = 0
        Top = 0
        Width = 283
        Height = 484
        Hint = ''
        HeaderTitle = 'Lista de Contatos'
        DataSource = ds_contacts
        Options = [dgColumnMove, dgRowSelect, dgAutoRefreshRow]
        ReadOnly = True
        LoadMask.Message = 'Loading data...'
        Align = alClient
        ParentFont = False
        TabOrder = 0
        OnCellClick = dbg_contactCellClick
        OnFieldImageURL = dbg_contactFieldImageURL
        OnDrawColumnCell = dbg_contactDrawColumnCell
        Columns = <
          item
            FieldName = 'name'
            Title.Caption = 'Identifica'#231#227'o'
            Title.Font.Height = -16
            Width = 200
          end
          item
            FieldName = 'active'
            Title.Caption = 'active'
            Width = 30
            ImageOptions.Visible = True
            ImageOptions.Width = 16
            ImageOptions.Height = 16
          end>
      end
    end
    object Sb_Atualizar: TUniSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 279
      Height = 39
      Hint = ''
      Enabled = False
      Caption = 'Atualizar'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = Sb_AtualizarClick
    end
  end
  object Container: TUniContainerPanel [1]
    Left = 289
    Top = 0
    Width = 877
    Height = 535
    Hint = ''
    ParentColor = False
    Align = alClient
    AlignmentControl = uniAlignmentClient
    ParentAlignmentControl = False
    TabOrder = 1
    Layout = 'fit'
    object pc_whatsAppTalk: TUniPageControl
      Left = 0
      Top = 0
      Width = 877
      Height = 535
      Hint = ''
      Align = alClient
      TabOrder = 1
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 120
    Top = 144
  end
  inherited ds_msg: TDataSource
    Left = 120
  end
  inherited MenuTask: TUniMainMenu
    Left = 40
    Top = 144
    inherited MnuTarefas: TUniMenuItem
      object AtivaroWhatsApp1: TUniMenuItem
        Caption = 'Ativar o WhatsApp'
        OnClick = AtivaroWhatsApp1Click
      end
      object Sair1: TUniMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
  object cds_contacts: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 218
    Top = 186
    object cds_contactsimg_full_url: TStringField
      FieldName = 'img_full_url'
      Size = 255
    end
    object cds_contactsid: TStringField
      FieldName = 'id'
    end
    object cds_contactsname: TStringField
      FieldName = 'name'
      Size = 100
    end
    object cds_contactsupdated_at: TDateTimeField
      FieldName = 'updated_at'
    end
    object cds_contactsactive: TStringField
      FieldName = 'active'
      Size = 1
    end
  end
  object ds_contacts: TDataSource
    DataSet = cds_contacts
    Left = 218
    Top = 234
  end
  object TimerList: TUniTimer
    Interval = 10000
    Enabled = False
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = TimerListTimer
    Left = 156
    Top = 355
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://192.168.100.24:8080/sendText'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 136
    Top = 424
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Method = rmPOST
    Params = <
      item
        name = 'body'
        ContentType = ctAPPLICATION_JSON
      end>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 136
    Top = 480
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 144
    Top = 536
  end
end
