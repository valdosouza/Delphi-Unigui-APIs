inherited TasConfigNfe: TTasConfigNfe
  Caption = 'Config Nfe'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    Top = 24
    Height = 297
    ExplicitTop = 24
    ExplicitHeight = 297
  end
  object pnl_topo: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 722
    Height = 24
    Hint = ''
    Align = alTop
    TabOrder = 2
    BorderStyle = ubsNone
    Caption = ''
    object UniPanel5: TUniPanel
      Left = 288
      Top = 232
      Width = 1
      Height = 25
      Hint = ''
      TabOrder = 1
      Caption = 'UniPanel5'
    end
    object Pnl_Cert_Expir: TUniPanel
      Left = 256
      Top = 0
      Width = 466
      Height = 24
      Hint = ''
      Align = alClient
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = 'Certicado Expira em'
    end
    object Pnl_Cert_Valid: TUniPanel
      Left = 0
      Top = 0
      Width = 256
      Height = 24
      Hint = ''
      Align = alLeft
      TabOrder = 3
      BorderStyle = ubsFrameLowered
      Caption = 'Validade de Certificado:'
    end
  end
  object UniFileUpload: TUniFileUpload
    MaxAllowedSize = 10485760
    Filter = '*.pfx'
    Title = 'Carregar Certificado'
    Messages.Uploading = 'Carregando'
    Messages.PleaseWait = 'Por favor. Aguarde'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando'
    Messages.UploadError = 'Erro no Carregamento'
    Messages.Upload = 'Carregar'
    Messages.NoFileError = 'Por favor selecione o arquivo'
    Messages.BrowseText = 'Procurar'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    Overwrite = True
    OnCompleted = UniFileUploadCompleted
    Left = 264
    Top = 264
  end
end
