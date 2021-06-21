inherited BaseSearch: TBaseSearch
  Width = 680
  Height = 555
  ExplicitHeight = 305
  inherited pnl_Top: TUniPanel
    Width = 680
  end
  object pnl_botao: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 36
    Width = 674
    Height = 58
    Hint = ''
    Align = alTop
    TabOrder = 1
    BorderStyle = ubsFrameRaised
    Caption = ''
    ExplicitWidth = 445
  end
  object UniPageControl1: TUniPageControl
    Left = 0
    Top = 97
    Width = 680
    Height = 458
    Hint = ''
    ActivePage = tbs_result
    Align = alClient
    TabOrder = 2
    ExplicitLeft = -207
    ExplicitTop = 94
    ExplicitWidth = 887
    ExplicitHeight = 461
    object tbs_result: TUniTabSheet
      Hint = ''
      Caption = 'Resultado'
      ExplicitWidth = 879
      ExplicitHeight = 433
      object Dbg_search: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 666
        Height = 424
        Hint = ''
        DataSource = Ds_Search
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 152
    Top = 111
  end
  object cds_search: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 152
    Top = 159
  end
  object Ds_Search: TDataSource
    DataSet = cds_search
    Left = 152
    Top = 224
  end
end
