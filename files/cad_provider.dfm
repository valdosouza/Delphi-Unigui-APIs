inherited CadProvider: TCadProvider
  Caption = 'Cadastro de Fornecedor'
  Images = UMM.uImg32
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pg_Main: TUniPageControl
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 692
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      object Rg_CadastroAtivo: TUniRadioGroup
        Left = 3
        Top = 0
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
