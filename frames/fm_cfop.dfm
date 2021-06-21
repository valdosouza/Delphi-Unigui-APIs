inherited FmCFOP: TFmCFOP
  Width = 445
  ExplicitWidth = 445
  inherited pnl_lista: TUniPanel
    Width = 445
    ExplicitWidth = 445
    inherited Sb_Search: TUniSpeedButton
      Left = 419
      ExplicitLeft = 419
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 393
      ExplicitLeft = 393
      ExplicitTop = 22
      ExplicitHeight = 25
    end
    inherited DBLCB_Lista: TUniDBLookupComboBox
      Width = 384
      FieldLabel = 'Descri'#231#227'o do C.F.O.P.'
      ExplicitWidth = 384
    end
  end
  inherited DSP: TDataSetProvider
    Top = 56
  end
  inherited cds_search: TClientDataSet
    Top = 57
  end
  inherited ds_search: TDataSource
    Top = 57
  end
end
