inherited FmMedPosProg: TFmMedPosProg
  Width = 295
  Height = 41
  ExplicitWidth = 295
  ExplicitHeight = 41
  inherited pnl_lista: TUniPanel
    Width = 295
    Height = 41
    ExplicitWidth = 295
    ExplicitHeight = 41
    inherited Sb_Search: TUniSpeedButton
      Left = 243
      Height = 16
      OnClick = Sb_SearchClick
      ExplicitLeft = 243
      ExplicitTop = 22
      ExplicitHeight = 16
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 272
      Height = 16
      OnClick = Sb_RegisterClick
      ExplicitLeft = 272
      ExplicitTop = 22
      ExplicitHeight = 16
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 234
      Height = 30
      ListField = 'id;description'
      FieldLabel = 'Posi'#231#227'o'
      ExplicitWidth = 234
      ExplicitHeight = 30
    end
  end
end
