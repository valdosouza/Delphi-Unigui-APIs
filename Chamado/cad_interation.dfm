inherited CadInteration: TCadInteration
  ClientHeight = 508
  ClientWidth = 858
  Caption = 'Chamado - Cadastro de Intera'#231#245'es'
  FormStyle = fsMDIChild
  OnAjaxEvent = UniFormAjaxEvent
  ExplicitWidth = 874
  ExplicitHeight = 547
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_row_1: TUniPanel [0]
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 852
    Height = 62
    Hint = ''
    Align = alTop
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    object E_Descricao: TUniEdit
      Left = 0
      Top = 0
      Width = 852
      Height = 62
      Hint = ''
      RTL = True
      ParentRTL = False
      Text = ''
      Align = alClient
      TabOrder = 1
      FieldLabel = 'Descri'#231#227'o do Chamado'
      FieldLabelAlign = laTop
    end
  end
  object pnl_button: TUniPanel [1]
    AlignWithMargins = True
    Left = 3
    Top = 447
    Width = 852
    Height = 58
    Hint = ''
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameRaised
    Caption = ''
    object Sb_Save: TUniSpeedButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 124
      Height = 48
      Hint = ''
      Caption = 'Salvar'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      TabOrder = 1
      OnClick = Sb_SaveClick
    end
    object Sb_Close: TUniSpeedButton
      AlignWithMargins = True
      Left = 135
      Top = 5
      Width = 124
      Height = 48
      Hint = ''
      Caption = 'Fechar'
      Align = alLeft
      ParentColor = False
      Color = clWindow
      TabOrder = 2
      OnClick = Sb_CloseClick
    end
  end
  object pc_main: TUniPageControl [2]
    Left = 0
    Top = 68
    Width = 858
    Height = 376
    Hint = ''
    ActivePage = tbs_atachament
    Align = alClient
    TabOrder = 2
    OnChange = pc_mainChange
    object tbs_interation: TUniTabSheet
      Hint = ''
      Caption = 'Detalhe o chamado'
      object M_Detail: TUniHTMLMemo
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 844
        Height = 342
        Hint = ''
        Lines.Strings = (
          'M_Detail')
        Align = alClient
        Color = clWindow
        TabOrder = 0
      end
    end
    object tbs_prints: TUniTabSheet
      Hint = ''
      Caption = 'Prints'
      object pnl_print_button: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 844
        Height = 58
        Hint = ''
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsFrameRaised
        Caption = ''
        object Sb_print_save: TUniSpeedButton
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 124
          Height = 48
          Hint = ''
          ClientEvents.ExtEvents.Strings = (
            
              'click=function click(sender, e, eOpts)'#13#10'{'#13#10'  var d = document.ge' +
              'tElementById('#39'imageView'#39').toDataURL('#39'image/png'#39');'#13#10'  d = d.slice' +
              '(d.indexOf('#39','#39')+1);'#13#10'  ajaxRequest(CadInteration.form, '#39'saveimg'#39 +
              ', ['#39'img='#39'+d]);'#13#10'}')
          Caption = 'Salvar'
          Align = alLeft
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = Sb_print_saveClick
        end
      end
      object pnl_print_img: TUniPanel
        Left = 0
        Top = 64
        Width = 850
        Height = 284
        Hint = ''
        Align = alClient
        TabOrder = 1
        Caption = ''
        object FramePrint: TUniHTMLFrame
          Left = 1
          Top = 1
          Width = 848
          Height = 282
          Hint = ''
          HTML.Strings = (
            '<canvas id="imageView" width="400" height="200">   </canvas>'
            '')
          Align = alClient
        end
      end
    end
    object tbs_atachament: TUniTabSheet
      Hint = ''
      Caption = 'Anexos'
      object pnl_attach_button: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 844
        Height = 58
        Hint = ''
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsFrameRaised
        Caption = ''
        object Sb_Attach_update: TUniSpeedButton
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
          OnClick = Sb_Attach_updateClick
        end
        object Sb_Attach_download: TUniSpeedButton
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
          OnClick = Sb_Attach_downloadClick
        end
        object Sb_Attach_load: TUniSpeedButton
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
          OnClick = Sb_Attach_loadClick
          ExplicitTop = 3
        end
        object Sb_Attach_delete: TUniSpeedButton
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
          OnClick = Sb_Attach_deleteClick
        end
      end
      object dbg_attach: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 67
        Width = 844
        Height = 278
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
  inherited cds_msg: TClientDataSet
    Left = 736
    Top = 328
  end
  inherited ds_msg: TDataSource
    Left = 744
    Top = 384
  end
  object UniPopupMenu1: TUniPopupMenu
    Left = 728
    Top = 224
    object ExcluirAnexo1: TUniMenuItem
      Caption = 'Excluir Anexo'
    end
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
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 614
    Top = 216
    object cdsimg: TBlobField
      FieldName = 'img'
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 614
    Top = 272
  end
end
