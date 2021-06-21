inherited FmMeasure: TFmMeasure
  Width = 305
  ExplicitWidth = 305
  inherited pnl_lista: TUniPanel
    Width = 305
    ExplicitWidth = 305
    inherited Sb_Search: TUniSpeedButton
      Left = 253
      OnClick = Sb_SearchClick
      ExplicitLeft = 253
      ExplicitTop = 22
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 282
      OnClick = Sb_RegisterClick
      ExplicitLeft = 282
      ExplicitTop = 22
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 244
      ListField = 'id;description'
      FieldLabel = 'Medidas'
      ExplicitWidth = 244
    end
  end
end
