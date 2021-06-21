inherited FmMerchandise: TFmMerchandise
  Width = 374
  Height = 38
  ExplicitWidth = 374
  ExplicitHeight = 38
  inherited pnl_lista: TUniPanel
    Width = 374
    Height = 38
    ExplicitWidth = 374
    ExplicitHeight = 38
    inherited Sb_Search: TUniSpeedButton
      Left = 322
      Height = 13
      OnClick = Sb_SearchClick
      ExplicitLeft = 322
      ExplicitTop = 22
      ExplicitHeight = 13
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 351
      Height = 13
      OnClick = Sb_RegisterClick
      ExplicitLeft = 351
      ExplicitTop = 22
      ExplicitHeight = 13
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 313
      Height = 27
      ListField = 'id;description'
      FieldLabel = 'Mercadoria'
      ExplicitWidth = 313
      ExplicitHeight = 27
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
      Required = True
      Size = 100
    end
  end
end
