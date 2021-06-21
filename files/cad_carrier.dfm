inherited CadCarrier: TCadCarrier
  Caption = 'Cadastro de Transportadora'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pg_Main: TUniPageControl
    inherited tb_Address: TUniTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
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
