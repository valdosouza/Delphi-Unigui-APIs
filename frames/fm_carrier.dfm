inherited FmCarrier: TFmCarrier
  Width = 256
  Height = 38
  ExplicitWidth = 256
  ExplicitHeight = 38
  inherited pnl_lista: TUniPanel
    Width = 256
    Height = 38
    ExplicitWidth = 256
    ExplicitHeight = 38
    inherited Sb_Search: TUniSpeedButton
      Left = 204
      Height = 13
      OnClick = Sb_SearchClick
      ExplicitLeft = 204
      ExplicitTop = 22
      ExplicitHeight = 13
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 233
      Height = 13
      OnClick = Sb_RegisterClick
      ExplicitLeft = 233
      ExplicitTop = 22
      ExplicitHeight = 13
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 195
      Height = 27
      ListField = 'id;name_company'
      FieldLabel = 'Transportadora'
      ExplicitWidth = 195
      ExplicitHeight = 27
    end
  end
end
