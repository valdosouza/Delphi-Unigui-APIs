inherited CadAccounting: TCadAccounting
  Caption = 'Cadastro Contabilidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    inherited pnl_fundo_linha_3: TUniPanel
      ExplicitWidth = 696
      inherited E_DtAniversary: TUniDateTimePicker
        ExplicitLeft = 595
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 692
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitWidth = 692
      inherited E_Obs: TUniMemo
        ExplicitWidth = 686
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      object Rg_CadastroAtivo: TUniRadioGroup
        Left = 3
        Top = 1
        Width = 118
        Height = 42
        Hint = ''
        Items.Strings = (
          'SIM'
          'N'#195'O')
        Caption = 'Cadastro Ativo'
        TabOrder = 0
        Columns = 2
      end
    end
  end
end
