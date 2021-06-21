inherited CadInterationProposal: TCadInterationProposal
  ClientHeight = 425
  ClientWidth = 703
  Caption = 'Cadastro de Proposta'
  ExplicitWidth = 719
  ExplicitHeight = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 361
    Width = 703
    ExplicitTop = 361
    ExplicitWidth = 703
  end
  inherited pnl_fundo: TUniPanel
    Width = 703
    Height = 105
    ExplicitWidth = 703
    ExplicitHeight = 105
    inherited pnl_row_2: TUniPanel
      Width = 699
      ExplicitWidth = 699
      inherited E_Description: TUniEdit
        Width = 693
        ExplicitWidth = 693
      end
    end
    inherited pnl_row_1: TUniPanel
      Width = 699
      ExplicitWidth = 699
      inherited ctn_Customer: TUniContainerPanel
        Width = 699
        ExplicitWidth = 699
      end
    end
  end
  inherited Pc_interacao: TUniPageControl
    Top = 105
    Width = 703
    Height = 256
    ExplicitTop = 105
    ExplicitWidth = 703
    ExplicitHeight = 256
    inherited tbs_interacao: TUniTabSheet
      ExplicitWidth = 695
      ExplicitHeight = 228
      inherited pnl_interacao_row_1: TUniPanel
        Top = 176
        Width = 695
        ExplicitTop = 176
        ExplicitWidth = 695
        object DTP_forecast_time: TUniDateTimePicker
          AlignWithMargins = True
          Left = 399
          Top = 3
          Width = 138
          Height = 46
          Hint = ''
          DateTime = 0.546413379626756100
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Kind = tUniTime
          Align = alLeft
          TabOrder = 2
          FieldLabel = 'Tempo Aproximado'
          FieldLabelAlign = laTop
        end
        object E_tag_value: TUniEdit
          AlignWithMargins = True
          Left = 543
          Top = 3
          Width = 120
          Height = 46
          Hint = ''
          RTL = True
          ParentRTL = False
          Text = ''
          Align = alLeft
          TabOrder = 3
          FieldLabel = 'Valor da Proposta'
          FieldLabelAlign = laTop
          InputType = 'text'
        end
      end
      inherited M_Detail: TUniHTMLMemo
        Width = 689
        Height = 170
        ExplicitLeft = 3
        ExplicitTop = 3
        ExplicitWidth = 689
        ExplicitHeight = 170
      end
    end
    inherited tbs_atachament: TUniTabSheet
      ExplicitWidth = 695
      ExplicitHeight = 228
      inherited UniPanel3: TUniPanel
        Width = 695
        ExplicitWidth = 695
      end
      inherited UniDBGrid1: TUniDBGrid
        Width = 689
        Height = 164
      end
    end
  end
  inherited Ds_cds_attachament: TDataSource
    Left = 576
    Top = 192
  end
end
