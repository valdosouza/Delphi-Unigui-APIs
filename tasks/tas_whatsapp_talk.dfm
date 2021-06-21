inherited TasWhatsappTalk: TTasWhatsappTalk
  Width = 1086
  Height = 690
  Align = alClient
  Anchors = [akLeft, akTop, akRight, akBottom]
  ExplicitWidth = 451
  ExplicitHeight = 305
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 473
    Height = 690
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = 'UniPanel1'
    ExplicitHeight = 305
    object html_chat: TUniHTMLFrame
      Left = 1
      Top = 1
      Width = 471
      Height = 631
      Hint = ''
      AutoScroll = True
      Align = alClient
      OnUpdateHtml = html_chatUpdateHtml
      ExplicitHeight = 246
      ScrollHeight = 631
      ScrollWidth = 471
    end
    object UniPanel2: TUniPanel
      Left = 1
      Top = 632
      Width = 471
      Height = 57
      Hint = ''
      Align = alBottom
      TabOrder = 2
      Alignment = taLeftJustify
      Caption = 'UniPanel1'
      ExplicitTop = 247
      object E_Message: TUniEdit
        Left = 1
        Top = 1
        Width = 469
        Height = 55
        Hint = ''
        Text = ''
        Align = alClient
        TabOrder = 1
        EmptyText = 'Digite uma Mensagem'
        FieldLabelAlign = laTop
        SelectOnFocus = True
        OnKeyDown = E_MessageKeyDown
      end
    end
  end
  object pnl_Comandos: TUniPanel
    AlignWithMargins = True
    Left = 476
    Top = 3
    Width = 268
    Height = 684
    Hint = ''
    Align = alLeft
    TabOrder = 1
    TitleVisible = True
    Title = 'Lista de Comandos'
    Caption = ''
    ExplicitHeight = 299
    object Sb_Boa_Noite: TUniSpeedButton
      Left = 1
      Top = 97
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Boa Noite'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      TabStop = False
      OnClick = Sb_Boa_NoiteClick
    end
    object UniSpeedButton2: TUniSpeedButton
      Left = 1
      Top = 1
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Bom dia'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      TabStop = False
      OnClick = UniSpeedButton2Click
    end
    object UniSpeedButton3: TUniSpeedButton
      Left = 1
      Top = 49
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Boa Tarde'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 3
      TabStop = False
      OnClick = UniSpeedButton3Click
    end
    object sb_sendMessage: TUniSpeedButton
      Left = 1
      Top = 635
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Enviar mensagem'
      Align = alBottom
      ParentColor = False
      Color = clWindow
      TabOrder = 4
      OnClick = sb_sendMessageClick
      ExplicitTop = 250
    end
    object UniSpeedButton5: TUniSpeedButton
      Left = 1
      Top = 193
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Enviar Sauda'#231#227'o e Link do App'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 5
      TabStop = False
      OnClick = UniSpeedButton5Click
    end
    object UniSpeedButton1: TUniSpeedButton
      Left = 1
      Top = 145
      Width = 266
      Height = 48
      Hint = ''
      Caption = 'Enviar Somente Link do App'
      Align = alTop
      ParentColor = False
      Color = clWindow
      TabOrder = 6
      TabStop = False
      OnClick = UniSpeedButton1Click
    end
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'http://192.168.100.24:8080/sendText'
    ContentType = 'application/json'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 496
    Top = 208
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
    Left = 512
    Top = 304
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 520
    Top = 360
  end
  object Tm_talk: TUniTimer
    ClientEvent.Strings = (
      'function(sender)'
      '{'
      ' '
      '}')
    OnTimer = Tm_talkTimer
    Left = 516
    Top = 427
  end
end
