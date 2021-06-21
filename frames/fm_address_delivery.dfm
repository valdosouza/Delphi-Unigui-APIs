inherited FmAdressDelivery: TFmAdressDelivery
  Width = 305
  Height = 39
  ExplicitWidth = 305
  ExplicitHeight = 39
  inherited pnl_lista: TUniPanel
    Width = 305
    Height = 39
    ExplicitWidth = 305
    ExplicitHeight = 39
    inherited Sb_Search: TUniSpeedButton
      Left = 253
      Height = 14
      OnClick = Sb_SearchClick
      ExplicitLeft = 253
      ExplicitHeight = 14
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 282
      Height = 14
      Visible = False
      ExplicitLeft = 282
      ExplicitTop = 22
      ExplicitHeight = 14
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 244
      Height = 28
      ListField = 'id;name_company'
      FieldLabel = 'Endere'#231'o de Entrega'
      ExplicitWidth = 244
      ExplicitHeight = 28
    end
  end
end
