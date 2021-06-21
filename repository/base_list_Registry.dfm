inherited BaseListRegistry: TBaseListRegistry
  ClientWidth = 574
  Caption = 'BaseListRegistry'
  ExplicitWidth = 590
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Width = 574
    ExplicitWidth = 574
  end
  inherited pnl_fundo: TUniPanel
    Width = 574
    ExplicitWidth = 574
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 570
      Height = 135
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
    end
    object dbg_list: TUniDBGrid
      Left = 2
      Top = 137
      Width = 570
      Height = 182
      Hint = ''
      DataSource = ds_search
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 2
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 8
    Top = 184
  end
  object cds_Items: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 202
  end
  object ds_search: TDataSource
    DataSet = cds_Items
    Left = 152
    Top = 258
  end
end
