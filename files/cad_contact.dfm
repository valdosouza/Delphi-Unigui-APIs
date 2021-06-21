inherited CadContact: TCadContact
  Caption = 'Cadastro de Contato'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    object Ctn_Entity: TUniContainerPanel
      Left = 160
      Top = 7
      Width = 479
      Height = 37
      Hint = ''
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
    end
  end
  inherited Pg_Main: TUniPageControl
    ActivePage = UniTabSheet1
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Outras Inform'#231#245'es'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 203
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
  inherited MenuTask: TUniMainMenu
    Left = 128
    Top = 65520
  end
end
