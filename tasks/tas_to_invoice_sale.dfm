inherited TasToInvoiceSale: TTasToInvoiceSale
  Caption = 'TasToInvoiceSale'
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniPanel3: TUniPanel
    inherited Grp_Parameters: TUniGroupBox
      inherited chbx_get_NFe_authorization: TUniCheckBox
        Width = 210
        ExplicitWidth = 210
      end
      inherited chbx_NF_byHand: TUniCheckBox
        Top = 249
        Visible = False
        ExplicitTop = 249
      end
      inherited Chbx_Sum_ICMS_NF: TUniCheckBox
        Top = 31
        Width = 210
        ExplicitTop = 31
        ExplicitWidth = 210
      end
      inherited Chbx_Sum_IPI_ICMS: TUniCheckBox
        Top = 47
        Width = 210
        ExplicitTop = 47
        ExplicitWidth = 210
      end
      inherited Chbx_Sum_IPI_ICMS_ST: TUniCheckBox
        Top = 63
        Width = 210
        ExplicitTop = 63
        ExplicitWidth = 210
      end
      inherited Chbx_spread_ICMS: TUniCheckBox
        Top = 136
        Width = 210
        Visible = False
        ExplicitTop = 136
        ExplicitWidth = 210
      end
      inherited Chbx_spread_ICMS_ST: TUniCheckBox
        Visible = False
      end
      inherited Chbx_spread_IPI: TUniCheckBox
        Width = 210
        Visible = False
        ExplicitWidth = 210
      end
      inherited Chbx_UpdateStock: TUniCheckBox
        Width = 210
        Visible = False
        ExplicitWidth = 210
      end
      inherited Chbx_Mva_Original: TUniCheckBox
        Top = 79
        Width = 210
        ExplicitTop = 79
        ExplicitWidth = 210
      end
      inherited Chbx_SumFreight: TUniCheckBox
        Left = 8
        Top = 231
        Width = 210
        Visible = False
        ExplicitLeft = 8
        ExplicitTop = 231
        ExplicitWidth = 210
      end
    end
    inherited UniPanel5: TUniPanel
      inherited Ctn_Cfop: TUniContainerPanel
        Visible = False
      end
    end
    inherited UniPanel4: TUniPanel
      inherited RG_Direction_Types: TUniRadioGroup
        Visible = False
      end
    end
  end
  inherited pnl_Botao: TUniPanel
    object UniButton1: TUniButton
      Left = 168
      Top = 6
      Width = 75
      Height = 25
      Hint = ''
      Caption = 'UniButton1'
      TabOrder = 8
      OnClick = UniButton1Click
    end
  end
  inherited UniPanel1: TUniPanel
    inherited pg_Total: TUniPageControl
      inherited tbs_Totais: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 714
        ExplicitHeight = 92
      end
      inherited tbs_Shipping: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 714
        ExplicitHeight = 92
      end
      inherited tbs_other: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 714
        ExplicitHeight = 92
        inherited UniPanel2: TUniPanel
          inherited Grp_Ctrl_docs: TUniGroupBox
            Visible = False
          end
          inherited Grp_Ctrl_docs_kind: TUniRadioGroup
            Visible = False
          end
          inherited Chbx_create_bills_pay: TUniCheckBox
            Top = 119
            Width = 210
            Visible = False
            ExplicitTop = 119
            ExplicitWidth = 210
          end
          inherited Chbx_create_bills_receive: TUniCheckBox
            Top = 102
            Width = 210
            Visible = False
            ExplicitTop = 102
            ExplicitWidth = 210
          end
          inherited Chbx_Ctrl_returns: TUniCheckBox
            Width = 210
            Visible = False
            ExplicitWidth = 210
          end
        end
      end
    end
  end
end
