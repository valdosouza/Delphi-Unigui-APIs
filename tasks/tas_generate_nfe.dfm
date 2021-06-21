inherited TasGenerateNfe: TTasGenerateNfe
  ClientHeight = 489
  ClientWidth = 664
  Caption = 'TasGenerateNfe'
  ExplicitWidth = 680
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 664
    Height = 33
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object Pnl_Cert_Expir: TUniPanel
      Left = 319
      Top = 0
      Width = 345
      Height = 33
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = 'O certificado expira em 1 dia(s)'
    end
    object Pnl_Cert_Valid: TUniPanel
      Left = 0
      Top = 0
      Width = 319
      Height = 33
      Hint = ''
      Align = alLeft
      Anchors = [akLeft, akTop, akBottom]
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = 'Validade do Certificado Digital'
    end
  end
  object UniPanel2: TUniPanel [1]
    Left = 0
    Top = 421
    Width = 664
    Height = 68
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      664
      68)
    object SB_conference: TUniSpeedButton
      Left = 6
      Top = 8
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Conferir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
    object SB_authorize: TUniSpeedButton
      Left = 97
      Top = 8
      Width = 91
      Height = 54
      Hint = ''
      Caption = 'Autorizar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
    object SB_Consult: TUniSpeedButton
      Left = 188
      Top = 8
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Consultar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
    object SB_Cancel: TUniSpeedButton
      Left = 281
      Top = 8
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Cancelar'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
    object SB_Print: TUniSpeedButton
      Left = 374
      Top = 8
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'Imprimir'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
    object Sb_Close: TUniSpeedButton
      Left = 562
      Top = 8
      Width = 95
      Height = 54
      Hint = ''
      Caption = 'Sair'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      OnClick = Sb_CloseClick
    end
    object sb_Email: TUniSpeedButton
      Left = 468
      Top = 8
      Width = 93
      Height = 54
      Hint = ''
      Caption = 'e-mail'
      Anchors = [akLeft, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
    end
  end
  object UniPanel5: TUniPanel [2]
    Left = 0
    Top = 376
    Width = 664
    Height = 45
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 2
    BorderStyle = ubsFrameLowered
    Caption = ''
  end
  object dbg_Msg: TUniDBGrid [3]
    Left = 0
    Top = 33
    Width = 664
    Height = 343
    Hint = ''
    HeaderTitle = 'Acompanhamento da Opera'#231#227'o com Nota Fiscal Eletr'#244'nica'
    HeaderTitleAlign = taCenter
    LoadMask.Message = 'Carregando Dados'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = 'Refer'#234'ncia'
        Width = 304
        CheckBoxField.FieldValues = 'true;false'
      end
      item
        FieldName = 'mensagem'
        Title.Caption = 'Mensagem'
        Width = 604
        CheckBoxField.FieldValues = 'true;false'
      end>
  end
end
