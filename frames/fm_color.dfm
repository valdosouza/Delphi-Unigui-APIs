inherited FmColor: TFmColor
  Width = 315
  ExplicitWidth = 315
  inherited pnl_lista: TUniPanel
    Width = 315
    ExplicitWidth = 315
    inherited Sb_Search: TUniSpeedButton
      Left = 263
      OnClick = Sb_SearchClick
      ExplicitLeft = 263
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 292
      OnClick = Sb_RegisterClick
      ExplicitLeft = 292
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 254
      ListField = 'id;description'
      FieldLabel = 'Cor'
      ExplicitWidth = 254
    end
  end
  inherited ds_search: TDataSource
    Left = 227
  end
end
