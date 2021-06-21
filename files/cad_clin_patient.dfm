inherited CadClinPatient: TCadClinPatient
  Caption = 'Cadastro de Paciente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_fundo: TUniPanel
    inherited pnl_fundo_linha_1: TUniPanel
      inherited RG_Pessoa: TUniRadioGroup
        Visible = False
      end
      inherited Sb_PesCNPJ: TUniSpeedButton
        Visible = False
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    inherited tbs_tributacao: TUniTabSheet
      inherited ChBx_OptanteSimples: TUniCheckBox
        Visible = False
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      object pnl_outrasinfo_row_1: TUniPanel
        Left = 0
        Top = 0
        Width = 692
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsNone
        Caption = ''
        object Rg_CadastroAtivo: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 118
          Height = 46
          Hint = ''
          Items.Strings = (
            'SIM'
            'N'#195'O')
          Align = alLeft
          Caption = 'Cadastro Ativo'
          TabOrder = 1
          Columns = 2
        end
        object ctn_clin_module: TUniContainerPanel
          Left = 124
          Top = 0
          Width = 287
          Height = 52
          Hint = ''
          ParentColor = False
          Align = alLeft
          TabOrder = 2
        end
      end
    end
  end
end
