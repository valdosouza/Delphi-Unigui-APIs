inherited FmCountry: TFmCountry
  Width = 254
  Height = 44
  ExplicitWidth = 254
  ExplicitHeight = 44
  inherited pnl_lista: TUniPanel
    Width = 254
    Height = 44
    ExplicitWidth = 254
    ExplicitHeight = 44
    inherited Sb_Search: TUniSpeedButton
      Left = 202
      Height = 19
      Visible = False
      OnClick = Sb_SearchClick
      ExplicitLeft = 202
      ExplicitTop = 22
      ExplicitHeight = 19
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 231
      Height = 19
      Visible = False
      OnClick = Sb_RegisterClick
      ExplicitLeft = 231
      ExplicitTop = 22
      ExplicitHeight = 19
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 193
      Height = 33
      ListField = 'name'
      FieldLabel = 'Pa'#237's'
      CaseSensitive = True
      ExplicitWidth = 193
      ExplicitHeight = 33
    end
  end
  inherited DSP: TDataSetProvider
    Left = 48
    Top = 41
  end
  inherited cds_search: TClientDataSet
    Left = 100
  end
  inherited ds_search: TDataSource
    Left = 163
  end
end
