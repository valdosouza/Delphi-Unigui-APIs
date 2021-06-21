inherited FmStockList: TFmStockList
  Width = 331
  Height = 37
  ExplicitWidth = 331
  ExplicitHeight = 37
  object chbx_UpdateStock: TUniCheckBox [0]
    Left = 1
    Top = 0
    Width = 16
    Height = 17
    Hint = ''
    Checked = True
    Caption = ''
    TabOrder = 1
    OnClick = chbx_UpdateStockClick
  end
  inherited pnl_lista: TUniPanel
    Width = 331
    Height = 37
    ExplicitWidth = 331
    ExplicitHeight = 37
    inherited Sb_Search: TUniSpeedButton
      Left = 279
      Height = 12
      OnClick = Sb_SearchClick
      ExplicitLeft = 279
      ExplicitHeight = 12
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 308
      Height = 12
      OnClick = Sb_RegisterClick
      ExplicitLeft = 308
      ExplicitHeight = 12
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 270
      Height = 26
      ListField = 'id;description'
      FieldLabel = 'Estoques'
      ExplicitWidth = 270
      ExplicitHeight = 26
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
      DisplayFormat = '000'
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 45
    end
    object cds_searchkind: TStringField
      FieldName = 'kind'
      FixedChar = True
      Size = 1
    end
  end
end
