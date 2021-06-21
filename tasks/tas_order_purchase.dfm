inherited TasOrderPurchase: TTasOrderPurchase
  ClientHeight = 509
  ClientWidth = 753
  Caption = 'Tarefa de Pedido de Compra'
  Menu = nil
  ExplicitWidth = 769
  ExplicitHeight = 548
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 445
    Width = 753
    ExplicitTop = 445
    ExplicitWidth = 753
    inherited SB_Insert: TUniSpeedButton
      Width = 92
      ExplicitWidth = 92
    end
    inherited SB_Change: TUniSpeedButton
      Left = 97
      Width = 92
      ExplicitLeft = 97
      ExplicitWidth = 92
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 189
      Width = 94
      ExplicitLeft = 189
      ExplicitWidth = 94
    end
    inherited SB_Save: TUniSpeedButton
      Left = 283
      Width = 94
      ExplicitLeft = 283
      ExplicitWidth = 94
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 377
      Width = 94
      ExplicitLeft = 377
      ExplicitWidth = 94
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 471
      Width = 96
      ExplicitLeft = 471
      ExplicitWidth = 96
    end
    inherited Sb_Invoice: TUniSpeedButton
      Left = 472
      Width = 94
      ExplicitLeft = 472
      ExplicitWidth = 94
    end
    inherited Sb_print: TUniSpeedButton
      Left = 566
      Width = 94
      ExplicitLeft = 566
      ExplicitWidth = 94
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 753
    Height = 92
    Align = alTop
    ExplicitTop = 0
    ExplicitWidth = 753
    ExplicitHeight = 92
    object L_Codigo: TUniLabel
      Left = 5
      Top = 6
      Width = 44
      Height = 14
      Hint = ''
      Caption = 'N'#250'mero'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object E_Number: TUniEdit
      Left = 4
      Top = 21
      Width = 72
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object E_DateRegistry: TUniDateTimePicker
      Left = 82
      Top = 21
      Width = 99
      Hint = ''
      DateTime = 42544.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 3
    end
    object L_DtRegistry: TUniLabel
      Left = 84
      Top = 6
      Width = 69
      Height = 14
      Hint = ''
      Caption = 'Data Cadastro'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 4
    end
    object Ctn_Provider: TUniContainerPanel
      Left = 183
      Top = 8
      Width = 567
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 5
    end
    object Ctn_PaymentType: TUniContainerPanel
      Left = 4
      Top = 48
      Width = 365
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 6
    end
  end
  object pg_Geral: TUniPageControl [2]
    Left = 0
    Top = 92
    Width = 753
    Height = 353
    Hint = ''
    ActivePage = tbs_List
    Align = alClient
    TabOrder = 2
    object tbs_List: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Mercadoria'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Ctn_Order_itens_Purchase: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 325
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
    object tbs_other: TUniTabSheet
      Hint = ''
      Caption = 'Outras Informa'#231#245'es'
      object UniPanel4: TUniPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 325
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object UniLabel13: TUniLabel
          Left = 4
          Top = 5
          Width = 60
          Height = 14
          Hint = ''
          Caption = 'Observa'#231#227'o'
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          TabOrder = 1
        end
        object M_note: TUniMemo
          Left = 4
          Top = 22
          Width = 736
          Height = 106
          Hint = ''
          TabOrder = 2
        end
        object chbx_approved: TUniCheckBox
          Left = 4
          Top = 131
          Width = 85
          Height = 17
          Hint = ''
          Caption = 'Aprovado'
          TabOrder = 3
        end
      end
    end
    object tbs_billing: TUniTabSheet
      Hint = ''
      Caption = 'Cobran'#231'a'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 325
        Hint = ''
        Align = alClient
        TabOrder = 0
        BorderStyle = ubsFrameLowered
        Caption = ''
        object Ctn_Cobranca: TUniContainerPanel
          Left = 5
          Top = 7
          Width = 734
          Height = 37
          Hint = ''
          ParentColor = False
          TabOrder = 1
        end
      end
    end
    object tbs_Delivery: TUniTabSheet
      Hint = ''
      Caption = 'Entrega'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object Ctn_Shipping: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 325
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
      end
    end
  end
  object Ctn_Installment_open: TUniContainerPanel [3]
    Left = 370
    Top = 48
    Width = 379
    Height = 37
    Hint = ''
    ParentColor = False
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 3
  end
  inherited MenuTask: TUniMainMenu
    Left = 65
    Top = 129
    inherited MnuTarefas: TUniMenuItem
      object ListBuy: TUniMenuItem
        Caption = 'Lista de Compra'
        OnClick = ListBuyClick
      end
      object NotaFiscal1: TUniMenuItem
        Caption = 'Nota Fiscal'
        OnClick = NotaFiscal1Click
      end
      object Copiaritens1: TUniMenuItem
        Caption = 'Copiar itens'
        OnClick = Copiaritens1Click
      end
    end
  end
end
