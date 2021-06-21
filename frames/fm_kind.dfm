inherited FmKind: TFmKind
  Width = 448
  Height = 55
  ExplicitWidth = 448
  ExplicitHeight = 55
  inherited pnl_lista: TUniPanel
    Width = 448
    Height = 55
    ExplicitWidth = 448
    ExplicitHeight = 93
    inherited Sb_Search: TUniSpeedButton
      Left = 422
      Height = 30
      ExplicitLeft = 422
      ExplicitHeight = 68
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 396
      Height = 30
      OnClick = Sb_RegisterClick
      ExplicitLeft = 396
      ExplicitHeight = 68
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 387
      Height = 44
      FieldLabel = 'Tipo'
      ExplicitWidth = 387
      ExplicitHeight = 82
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
