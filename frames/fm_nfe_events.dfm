inherited FmNfeEvents: TFmNfeEvents
  Height = 40
  ExplicitHeight = 40
  inherited pnl_lista: TUniPanel
    Height = 40
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Height = 15
      Visible = False
      ExplicitHeight = 15
    end
    inherited Sb_Register: TUniSpeedButton
      Height = 15
      Visible = False
      ExplicitHeight = 15
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Height = 29
      FieldLabel = 'Eventos'
      ExplicitHeight = 29
    end
  end
end
