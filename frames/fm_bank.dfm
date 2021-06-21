inherited FmBank: TFmBank
  Width = 373
  ExplicitWidth = 373
  inherited pnl_lista: TUniPanel
    Width = 373
    ExplicitTop = 0
    ExplicitWidth = 373
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 321
      OnClick = Sb_SearchClick
      ExplicitLeft = 321
      ExplicitTop = 22
      ExplicitHeight = 15
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 350
      OnClick = Sb_RegisterClick
      ExplicitLeft = 350
      ExplicitTop = 22
      ExplicitHeight = 15
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 312
      ListField = 'number;name_company'
      FieldLabel = 'Banco'
      ExplicitWidth = 312
      ExplicitHeight = 29
    end
  end
end
