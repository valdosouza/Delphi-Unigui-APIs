inherited FmDeterBaseTaxIcmsST: TFmDeterBaseTaxIcmsST
  Width = 274
  ExplicitWidth = 274
  inherited pnl_lista: TUniPanel
    Width = 274
    ExplicitWidth = 274
    inherited Sb_Search: TUniSpeedButton
      Left = 222
      OnClick = Sb_SearchClick
      ExplicitLeft = 222
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 251
      OnClick = Sb_RegisterClick
      ExplicitLeft = 251
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 213
      ListField = 'id;description'
      FieldLabel = 'Determina'#231#227'o de Base ICMS ST.'
      ExplicitWidth = 213
    end
  end
end
