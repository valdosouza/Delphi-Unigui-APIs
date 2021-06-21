inherited FmObservation: TFmObservation
  Width = 309
  ExplicitWidth = 309
  inherited pnl_lista: TUniPanel
    Width = 309
    ExplicitWidth = 309
    inherited Sb_Search: TUniSpeedButton
      Left = 257
      OnClick = Sb_SearchClick
      ExplicitLeft = 257
      ExplicitTop = 22
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 286
      OnClick = Sb_RegisterClick
      ExplicitLeft = 286
      ExplicitTop = 22
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 248
      ListField = 'id;description'
      FieldLabel = 'Observa'#231#227'o'
      ExplicitWidth = 248
    end
  end
end
