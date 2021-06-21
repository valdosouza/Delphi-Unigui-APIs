inherited FmCustomer: TFmCustomer
  Width = 378
  ExplicitWidth = 378
  inherited pnl_lista: TUniPanel
    Width = 378
    ExplicitWidth = 314
    inherited Sb_Search: TUniSpeedButton
      Left = 355
      Margins.Right = 0
      OnClick = Sb_SearchClick
      ExplicitLeft = 355
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 326
      Margins.Right = 3
      OnClick = Sb_RegisterClick
      ExplicitLeft = 326
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 317
      ListField = 'id;name_company'
      FieldLabel = 'Clientes'
      ExplicitWidth = 317
    end
  end
end
