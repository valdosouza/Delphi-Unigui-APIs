inherited FmClinPatient: TFmClinPatient
  inherited pnl_lista: TUniPanel
    inherited Sb_Search: TUniSpeedButton
      OnClick = Sb_SearchClick
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited Sb_Register: TUniSpeedButton
      OnClick = Sb_RegisterClick
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      ListField = 'name_company'
      FieldLabel = 'Informe o nome do paciente'
    end
  end
end
