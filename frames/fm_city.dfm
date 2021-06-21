inherited FmCity: TFmCity
  Width = 328
  Height = 45
  ExplicitWidth = 328
  ExplicitHeight = 45
  inherited pnl_lista: TUniPanel
    Width = 328
    Height = 45
    ExplicitWidth = 328
    ExplicitHeight = 45
    inherited Sb_Search: TUniSpeedButton
      Left = 276
      Height = 20
      OnClick = Sb_SearchClick
      ExplicitLeft = 276
      ExplicitTop = 22
      ExplicitHeight = 20
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 305
      Height = 20
      OnClick = Sb_RegisterClick
      ExplicitLeft = 305
      ExplicitTop = 22
      ExplicitHeight = 20
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 267
      Height = 34
      ListField = 'name'
      ClearButton = True
      FieldLabel = 'Cidade'
      ExplicitWidth = 267
      ExplicitHeight = 34
    end
  end
  inherited DSP: TDataSetProvider
    Left = 64
  end
  inherited cds_search: TClientDataSet
    Left = 116
    Top = 40
  end
  inherited ds_search: TDataSource
    Left = 179
    Top = 40
  end
end
