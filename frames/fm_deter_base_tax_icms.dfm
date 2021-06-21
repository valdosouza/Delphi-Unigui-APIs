inherited FmDeterBaseTaxIcms: TFmDeterBaseTaxIcms
  Width = 274
  ExplicitWidth = 274
  inherited pnl_lista: TUniPanel
    Width = 274
    ExplicitWidth = 274
    inherited Sb_Search: TUniSpeedButton
      Left = 225
      Margins.Right = 0
      OnClick = Sb_SearchClick
      ExplicitLeft = 225
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 251
      OnClick = Sb_RegisterClick
      ExplicitLeft = 251
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 216
      ListField = 'id;description'
      FieldLabel = 'Determina'#231#227'o de Base ICMS'
      ExplicitWidth = 216
    end
  end
end
