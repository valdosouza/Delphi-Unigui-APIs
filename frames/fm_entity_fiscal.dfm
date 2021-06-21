inherited FmEntityFiscal: TFmEntityFiscal
  Width = 292
  ExplicitWidth = 292
  inherited pnl_lista: TUniPanel
    Width = 292
    ExplicitWidth = 292
    inherited Sb_Search: TUniSpeedButton
      Left = 240
      Visible = False
      OnClick = Sb_SearchClick
      ExplicitLeft = 240
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 269
      OnClick = Sb_RegisterClick
      ExplicitLeft = 269
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 231
      ListField = 'id;name_company'
      FieldLabel = 'Entidade Fiscal'
      ExplicitWidth = 231
    end
  end
end
