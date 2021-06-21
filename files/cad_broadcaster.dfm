inherited CadBroadCaster: TCadBroadCaster
  Caption = 'Cadastro de Ve'#237'culo de Comunica'#231#227'o '
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited pnl_fundo: TUniPanel
    inherited pnl_fundo_linha_1: TUniPanel
      inherited E_DocFiscal: TUniEdit
        Width = 117
        ExplicitWidth = 117
      end
      inherited E_Ins_Mun: TUniEdit
        Left = 565
        Width = 128
        ExplicitLeft = 565
        ExplicitWidth = 128
      end
      inherited E_RG_InscEst: TUniEdit
        Left = 446
        ExplicitLeft = 446
      end
      inherited Sb_PesCNPJ: TUniSpeedButton
        Left = 417
        ExplicitLeft = 417
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    inherited tbs_tributacao: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
      object Rg_CadastroAtivo: TUniRadioGroup
        Left = 3
        Top = -1
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
      object UniLabel6: TUniLabel
        Left = 128
        Top = 3
        Width = 96
        Height = 13
        Hint = ''
        Caption = 'Aplica'#231#227'o/Tipo M'#237'dia'
        TabOrder = 1
      end
      object Cb_kind_media: TUniComboBox
        Left = 126
        Top = 17
        Width = 145
        Hint = ''
        ParentShowHint = False
        Style = csDropDownList
        Text = 'Jornais e Revistas'
        Items.Strings = (
          'Jornais e Revistas'
          'R'#225'dios e TV'#39's'
          'On-line')
        ItemIndex = 0
        TabOrder = 2
        IconItems = <>
      end
      object E_kickback: TUniFormattedNumberEdit
        Left = 272
        Top = 17
        Width = 74
        Hint = ''
        Alignment = taRightJustify
        TabOrder = 3
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel13: TUniLabel
        Left = 347
        Top = 21
        Width = 11
        Height = 13
        Hint = ''
        Caption = '%'
        TabOrder = 4
      end
      object Lb_kickback: TUniLabel
        Left = 272
        Top = 2
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Comiss'#227'o'
        TabOrder = 5
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 112
    Top = 128
    inherited MnuTarefas: TUniMenuItem
      object Lista1: TUniMenuItem
        Caption = 'Tabela Jornal e Revista'
        OnClick = Lista1Click
      end
      object abelaOnLine1: TUniMenuItem
        Caption = 'Tabela R'#225'dio e TV'
        OnClick = abelaOnLine1Click
      end
      object abelaPortal1: TUniMenuItem
        Caption = 'Tabela Portal'
        OnClick = abelaPortal1Click
      end
      object iragem1: TUniMenuItem
        Caption = 'Cobertura/Tiragem'
        OnClick = iragem1Click
      end
    end
  end
end
