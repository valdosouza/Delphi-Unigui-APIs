inherited FmDischargeIcms: TFmDischargeIcms
  Width = 274
  Height = 45
  ExplicitWidth = 274
  ExplicitHeight = 45
  inherited pnl_lista: TUniPanel
    Width = 274
    Height = 45
    ExplicitWidth = 274
    ExplicitHeight = 45
    inherited Sb_Search: TUniSpeedButton
      Left = 222
      Height = 20
      OnClick = Sb_SearchClick
      ExplicitLeft = 222
      ExplicitTop = 22
      ExplicitHeight = 20
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 251
      Height = 20
      OnClick = Sb_RegisterClick
      ExplicitLeft = 251
      ExplicitTop = 22
      ExplicitHeight = 20
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 213
      Height = 34
      ListField = 'id;description'
      FieldLabel = 'Desonera'#231#227'o'
      ExplicitWidth = 213
      ExplicitHeight = 34
    end
  end
end
