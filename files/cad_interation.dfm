inherited CadInteration: TCadInteration
  ClientHeight = 459
  ClientWidth = 834
  Caption = 'Cadastro de Chamados'
  ExplicitWidth = 850
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 395
    Width = 834
    ExplicitTop = 395
    ExplicitWidth = 834
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 834
    Height = 113
    Align = alTop
    ExplicitTop = 0
    ExplicitWidth = 834
    ExplicitHeight = 113
    object pnl_row_2: TUniPanel
      Left = 2
      Top = 54
      Width = 830
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsNone
      Caption = ''
      object E_Description: TUniEdit
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 824
        Height = 46
        Hint = ''
        RTL = True
        ParentRTL = False
        Text = ''
        Align = alClient
        TabOrder = 1
        FieldLabel = 'Descri'#231#227'o da Intera'#231#227'o'
        FieldLabelAlign = laTop
      end
    end
    object pnl_row_1: TUniPanel
      Left = 2
      Top = 2
      Width = 830
      Height = 52
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      object ctn_Customer: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 830
        Height = 52
        Hint = ''
        Margins.Left = 5
        ParentColor = False
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object Pc_interacao: TUniPageControl [2]
    Left = 0
    Top = 113
    Width = 834
    Height = 282
    Hint = ''
    ActivePage = tbs_interacao
    Align = alClient
    TabOrder = 2
    object tbs_interacao: TUniTabSheet
      Hint = ''
      Caption = 'Detalhe o chamado'
      object pnl_interacao_row_1: TUniPanel
        Left = 0
        Top = 202
        Width = 826
        Height = 52
        Hint = ''
        Align = alBottom
        TabOrder = 0
        BorderStyle = ubsNone
        Caption = ''
        object ctn_Situacao: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 52
          Hint = ''
          Margins.Left = 5
          ParentColor = False
          Align = alLeft
          TabOrder = 1
        end
      end
      object M_Detail: TUniHTMLMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 820
        Height = 196
        Hint = ''
        Align = alClient
        Color = clWindow
        TabOrder = 1
      end
    end
    object tbs_atachament: TUniTabSheet
      Hint = ''
      Caption = 'Anexo'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniPanel3: TUniPanel
        Left = 0
        Top = 0
        Width = 826
        Height = 58
        Hint = ''
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsFrameRaised
        Caption = ''
        object Sb_search_Attachament: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 124
          Height = 48
          Hint = ''
          Caption = 'Atualizar'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_search_AttachamentClick
        end
        object Btn_Download: TUniSpeedButton
          AlignWithMargins = True
          Left = 395
          Top = 5
          Width = 124
          Height = 48
          Hint = ''
          Caption = 'Download Anexo'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = Btn_DownloadClick
        end
        object UniSpeedButton2: TUniSpeedButton
          AlignWithMargins = True
          Left = 135
          Top = 5
          Width = 124
          Height = 48
          Hint = ''
          Caption = 'Carregar Anexo'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 3
          OnClick = UniSpeedButton2Click
        end
        object Btn_ApagarAnexo: TUniSpeedButton
          AlignWithMargins = True
          Left = 265
          Top = 5
          Width = 124
          Height = 48
          Hint = ''
          Caption = 'Apagar Anexo'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 4
          OnClick = Btn_ApagarAnexoClick
        end
      end
      object UniDBGrid1: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 61
        Width = 820
        Height = 190
        Hint = ''
        DataSource = Ds_cds_attachament
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 1
        Columns = <
          item
            FieldName = 'path_file'
            Title.Caption = 'link para o anexo'
            Width = 780
          end>
      end
    end
  end
  inherited ds_msg: TDataSource
    Left = 200
    Top = 64
  end
  inherited MenuTask: TUniMainMenu
    Left = 72
    Top = 0
  end
  object UniFileUpload: TUniFileUpload
    Filter = '*.*'
    Title = 'Carregar Anexos'
    Messages.Uploading = 'Carregando'
    Messages.PleaseWait = 'Por favor Aguarde'
    Messages.Cancel = 'Cancelar'
    Messages.Processing = 'Processando'
    Messages.UploadError = 'Erro ao Carregar'
    Messages.Upload = 'Carregar'
    Messages.NoFileError = 'Por favor Selecione o Arquivo'
    Messages.BrowseText = 'Procurar'
    Messages.UploadTimeout = 'Timeout occurred...'
    Messages.MaxSizeError = 'File is bigger than maximum allowed size'
    Messages.MaxFilesError = 'You can upload maximum %d files.'
    OnCompleted = UniFileUploadCompleted
    Left = 240
    Top = 320
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 480
    Top = 199
  end
  object cds_attachament: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 480
    Top = 247
  end
  object Ds_cds_attachament: TDataSource
    AutoEdit = False
    DataSet = cds_attachament
    Left = 480
    Top = 312
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 728
    Top = 224
    object ExcluirAnexo1: TUniMenuItem
      Caption = 'Excluir Anexo'
    end
  end
end
