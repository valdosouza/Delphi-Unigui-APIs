inherited CadInstitution: TCadInstitution
  ClientHeight = 489
  Caption = 'Cadastro do Estabelecimento'
  WindowState = wsMinimized
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 425
    ExplicitTop = 425
    ExplicitWidth = 653
    inherited SB_Insert: TUniSpeedButton
      Left = 470
      Visible = False
      ExplicitLeft = 470
    end
    inherited SB_Change: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 374
      Visible = False
      ExplicitLeft = 374
    end
    inherited SB_Save: TUniSpeedButton
      Left = 93
      ExplicitLeft = 93
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 186
      ExplicitLeft = 186
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 279
      ExplicitLeft = 279
    end
  end
  inherited pnl_fundo: TUniPanel
    ExplicitWidth = 653
    inherited pnl_fundo_linha_1: TUniPanel
      ExplicitWidth = 649
      inherited E_Ins_Mun: TUniEdit
        ExplicitWidth = 85
      end
    end
    inherited pnl_fundo_linha_2: TUniPanel
      ExplicitWidth = 649
      inherited E_NickTrade: TUniEdit
        ExplicitWidth = 329
      end
    end
    inherited pnl_fundo_linha_3: TUniPanel
      ExplicitWidth = 649
      inherited Ctn_LineBusiness: TUniContainerPanel
        ExplicitWidth = 545
      end
      inherited E_DtAniversary: TUniDateTimePicker
        ExplicitLeft = 548
      end
    end
    inherited pnl_fundo_linha_4: TUniPanel
      ExplicitWidth = 649
      inherited E_WebSite: TUniEdit
        ExplicitWidth = 329
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    Height = 216
    ExplicitWidth = 653
    ExplicitHeight = 216
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 645
      ExplicitHeight = 188
      inherited Ctn_Address: TUniContainerPanel
        Height = 188
        ExplicitWidth = 645
        ExplicitHeight = 188
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitWidth = 645
      ExplicitHeight = 188
      inherited E_Obs: TUniMemo
        Height = 182
        ExplicitWidth = 639
        ExplicitHeight = 182
      end
    end
    inherited tbs_tributacao: TUniTabSheet
      ExplicitWidth = 645
      ExplicitHeight = 188
      inherited ChBx_OptanteSimples: TUniCheckBox
        ExplicitWidth = 639
      end
      inherited Chbx_IgnoraST: TUniCheckBox
        ExplicitWidth = 639
      end
      inherited Cb_Ind_IE_Dest: TUniComboBox
        ExplicitWidth = 639
      end
      inherited chbx_Just_Xml: TUniCheckBox
        ExplicitWidth = 639
      end
      inherited pnl_tributacai_linha_6: TUniPanel
        ExplicitWidth = 645
      end
      inherited pnl_tributacai_linha_7: TUniPanel
        ExplicitWidth = 645
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitWidth = 645
      ExplicitHeight = 188
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
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 232
    inherited MnuTarefas: TUniMenuItem
      object Usuarios: TUniMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = UsuariosClick
      end
    end
  end
end
