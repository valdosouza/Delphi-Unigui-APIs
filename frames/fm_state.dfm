inherited FmState: TFmState
  Width = 258
  Height = 43
  ExplicitWidth = 258
  ExplicitHeight = 43
  inherited pnl_lista: TUniPanel
    Width = 258
    Height = 43
    ExplicitWidth = 258
    ExplicitHeight = 43
    inherited Sb_Search: TUniSpeedButton
      Left = 206
      Height = 18
      Visible = False
      ExplicitLeft = 206
      ExplicitTop = 22
      ExplicitHeight = 18
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 235
      Height = 18
      Visible = False
      OnClick = Sb_RegisterClick
      ExplicitLeft = 235
      ExplicitTop = 22
      ExplicitHeight = 18
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 197
      Height = 32
      ListField = 'abbreviation'
      FieldLabel = 'Estado'
      CaseSensitive = True
      Style = csDropDownList
      ExplicitWidth = 197
      ExplicitHeight = 32
    end
  end
  inherited DSP: TDataSetProvider
    Left = 40
  end
  inherited cds_search: TClientDataSet
    Left = 92
  end
  inherited ds_search: TDataSource
    Left = 155
  end
end
