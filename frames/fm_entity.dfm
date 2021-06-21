inherited FmEntity: TFmEntity
  Width = 479
  ExplicitWidth = 479
  inherited pnl_lista: TUniPanel
    Width = 479
    ExplicitWidth = 479
    inherited Sb_Search: TUniSpeedButton
      Left = 453
      OnClick = Sb_SearchClick
      ExplicitLeft = 453
      ExplicitTop = 22
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 427
      OnClick = Sb_RegisterClick
      ExplicitLeft = 427
      ExplicitTop = 22
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 418
      ListField = 'id;name_company'
      FieldLabel = 'Entidade'
      ExplicitWidth = 418
    end
  end
end
