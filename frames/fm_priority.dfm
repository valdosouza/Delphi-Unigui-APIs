inherited FmPriority: TFmPriority
  Height = 62
  ExplicitHeight = 62
  inherited pnl_lista: TUniPanel
    Height = 62
    ExplicitHeight = 100
    inherited Sb_Search: TUniSpeedButton
      Height = 37
      OnClick = Sb_SearchClick
      ExplicitTop = 22
      ExplicitHeight = 37
    end
    inherited Sb_Register: TUniSpeedButton
      Height = 37
      OnClick = Sb_RegisterClick
      ExplicitTop = 22
      ExplicitHeight = 37
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Height = 51
      FieldLabel = 'Prioridades'
      ExplicitHeight = 51
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 50
    end
  end
end
