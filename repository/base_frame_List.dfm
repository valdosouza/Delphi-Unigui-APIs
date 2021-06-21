inherited BaseFrameList: TBaseFrameList
  Width = 419
  Height = 50
  ExplicitWidth = 419
  ExplicitHeight = 50
  object pnl_lista: TUniPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 50
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsNone
    Caption = ''
    ExplicitTop = 19
    ExplicitHeight = 29
    object Sb_Search: TUniSpeedButton
      AlignWithMargins = True
      Left = 393
      Top = 22
      Width = 23
      Height = 25
      Hint = ''
      Margins.Top = 22
      Caption = ''
      Align = alRight
      ParentColor = False
      Color = clWindow
      TabOrder = 1
    end
    object Sb_Register: TUniSpeedButton
      AlignWithMargins = True
      Left = 367
      Top = 22
      Width = 23
      Height = 25
      Hint = ''
      Margins.Top = 22
      Margins.Right = 0
      Caption = '...'
      Align = alRight
      ParentColor = False
      Color = clWindow
      TabOrder = 2
    end
    object DBLCB_Lista: TUniDBLookupComboBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 358
      Height = 39
      Hint = ''
      Margins.Bottom = 8
      ListField = 'description'
      ListSource = ds_search
      KeyField = 'id'
      ListFieldIndex = 0
      Align = alClient
      AnyMatch = True
      TabOrder = 3
      Color = clWindow
      MinQueryLength = 2
      RemoteQuery = True
      FieldLabel = 'Informe descri'#231#227'o da Lista'
      FieldLabelAlign = laTop
      FieldLabelFont.Color = clNavy
      Style = csDropDown
    end
  end
  object DSP: TDataSetProvider
    DataSet = UMM.Qr_Crud
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 104
    Top = 40
  end
  object cds_search: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 156
    Top = 41
  end
  object ds_search: TDataSource
    DataSet = cds_search
    Left = 219
    Top = 41
  end
end
