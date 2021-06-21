inherited fmPaymentType: TfmPaymentType
  Width = 304
  ExplicitWidth = 304
  inherited pnl_lista: TUniPanel
    Width = 304
    ExplicitWidth = 304
    ExplicitHeight = 40
    inherited Sb_Search: TUniSpeedButton
      Left = 258
      Margins.Right = 0
      OnClick = Sb_SearchClick
      ExplicitLeft = 255
      ExplicitTop = 0
      ExplicitHeight = 37
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 281
      Margins.Left = 0
      OnClick = Sb_RegisterClick
      ExplicitLeft = 281
      ExplicitTop = 0
      ExplicitHeight = 37
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 249
      ListField = 'id;description'
      FieldLabel = 'Tipos de Pagamentos'
      FieldLabelFont.Color = clBlack
      ExplicitWidth = 249
      ExplicitHeight = 29
    end
  end
end
