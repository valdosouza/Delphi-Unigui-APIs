inherited FmCategory: TFmCategory
  Width = 341
  Height = 46
  ExplicitWidth = 341
  ExplicitHeight = 46
  inherited pnl_lista: TUniPanel
    Width = 341
    Height = 46
    ExplicitWidth = 334
    ExplicitHeight = 46
    inherited Sb_Search: TUniSpeedButton
      Left = 315
      Height = 21
      Margins.Left = 0
      Visible = False
      OnClick = Sb_SearchClick
      ExplicitLeft = 315
      ExplicitHeight = 21
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 289
      Height = 21
      Margins.Right = 3
      OnClick = Sb_RegisterClick
      ExplicitLeft = 289
      ExplicitHeight = 21
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 280
      Height = 35
      ListField = 'id;description'
      FieldLabel = 'Categoria'
      ExplicitWidth = 280
      ExplicitHeight = 35
    end
  end
end
