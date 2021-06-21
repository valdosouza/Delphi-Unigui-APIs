inherited CadProductHasSelf: TCadProductHasSelf
  Caption = 'Composi'#231#227'o de produtos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    object dbg_Search: TUniDBGrid
      Left = 2
      Top = 2
      Width = 718
      Height = 418
      Hint = ''
      DataSource = ds_composition
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgTitleClick]
      WebOptions.FetchAll = True
      LoadMask.Message = 'Carregando os dados'
      Align = alClient
      TabOrder = 1
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 144
  end
  object cds_composition: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 202
  end
  object ds_composition: TDataSource
    DataSet = cds_composition
    Left = 152
    Top = 258
  end
end
