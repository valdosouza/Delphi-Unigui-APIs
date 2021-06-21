inherited TasExtMaintenanceItems: TTasExtMaintenanceItems
  ClientHeight = 290
  ClientWidth = 776
  Caption = 'TasExtMaintenanceItems'
  ExplicitWidth = 792
  ExplicitHeight = 349
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 226
    Width = 776
    ExplicitTop = 226
    ExplicitWidth = 776
    inherited SB_Insert: TUniSpeedButton
      Left = 470
      Visible = False
      ExplicitLeft = 470
    end
    inherited SB_Change: TUniSpeedButton
      Left = 376
      Visible = False
      ExplicitLeft = 376
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 283
      Visible = False
      ExplicitLeft = 283
    end
    inherited SB_Save: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 95
      ExplicitLeft = 95
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 188
      Visible = False
      ExplicitLeft = 188
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 776
    Height = 226
    ExplicitWidth = 776
    ExplicitHeight = 226
    object UniPageControl1: TUniPageControl
      Left = 2
      Top = 2
      Width = 772
      Height = 222
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Extintor'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel2: TUniLabel
            Left = 6
            Top = 8
            Width = 89
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero Sequ'#234'ncia'
            TabOrder = 1
          end
          object UniEdit2: TUniEdit
            Left = 6
            Top = 23
            Width = 89
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniRadioGroup1: TUniRadioGroup
            Left = 98
            Top = 8
            Width = 111
            Height = 37
            Hint = ''
            Items.Strings = (
              'Sim'
              'N'#227'o')
            Caption = 'Novo'
            TabOrder = 3
            Columns = 2
          end
          object Ctn_Brand: TUniContainerPanel
            Left = 212
            Top = 7
            Width = 256
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 4
          end
          object UniEdit3: TUniEdit
            Left = 471
            Top = 23
            Width = 88
            Hint = ''
            Text = ''
            TabOrder = 5
          end
          object UniLabel3: TUniLabel
            Left = 471
            Top = 8
            Width = 35
            Height = 13
            Hint = ''
            Caption = 'Projeto'
            TabOrder = 6
          end
          object UniLabel4: TUniLabel
            Left = 674
            Top = 8
            Width = 24
            Height = 13
            Hint = ''
            Caption = 'S'#233'rie'
            TabOrder = 7
          end
          object UniEdit4: TUniEdit
            Left = 674
            Top = 21
            Width = 80
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniRadioGroup2: TUniRadioGroup
            Left = 561
            Top = 8
            Width = 111
            Height = 37
            Hint = ''
            Items.Strings = (
              'Sim'
              'N'#227'o')
            Caption = 'Projeto Bombeiro'
            TabOrder = 9
            Columns = 2
          end
          object UniLabel5: TUniLabel
            Left = 6
            Top = 49
            Width = 19
            Height = 13
            Hint = ''
            Caption = 'Ano'
            TabOrder = 10
          end
          object UniEdit5: TUniEdit
            Left = 6
            Top = 63
            Width = 57
            Hint = ''
            Text = ''
            TabOrder = 11
          end
          object UniLabel6: TUniLabel
            Left = 65
            Top = 49
            Width = 33
            Height = 13
            Hint = ''
            Caption = 'Normal'
            TabOrder = 12
          end
          object UniEdit6: TUniEdit
            Left = 65
            Top = 63
            Width = 144
            Hint = ''
            Text = ''
            TabOrder = 13
          end
          object Ctn_1: TUniContainerPanel
            Left = 212
            Top = 47
            Width = 256
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 14
          end
          object UniEdit7: TUniEdit
            Left = 471
            Top = 63
            Width = 141
            Hint = ''
            Text = ''
            TabOrder = 15
          end
          object UniLabel7: TUniLabel
            Left = 471
            Top = 49
            Width = 109
            Height = 13
            Hint = ''
            Caption = 'Capaciadade Extintora'
            TabOrder = 16
          end
          object UniEdit8: TUniEdit
            Left = 614
            Top = 63
            Width = 137
            Hint = ''
            Text = ''
            TabOrder = 17
          end
          object UniLabel8: TUniLabel
            Left = 614
            Top = 49
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Pressuriza'#231#227'o'
            TabOrder = 18
          end
          object UniEdit10: TUniEdit
            Left = 435
            Top = 106
            Width = 141
            Hint = ''
            Text = ''
            TabOrder = 19
          end
          object UniLabel10: TUniLabel
            Left = 435
            Top = 91
            Width = 105
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero de Patrim'#244'nio'
            TabOrder = 20
          end
          object UniEdit9: TUniEdit
            Left = 292
            Top = 106
            Width = 141
            Hint = ''
            Text = ''
            TabOrder = 21
          end
          object UniLabel9: TUniLabel
            Left = 295
            Top = 91
            Width = 103
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero do Selo Atual'
            TabOrder = 22
          end
          object Ctn_2: TUniContainerPanel
            Left = 6
            Top = 90
            Width = 283
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 23
          end
          object UniCheckBox1: TUniCheckBox
            Left = 6
            Top = 133
            Width = 331
            Height = 17
            Hint = ''
            Caption = 'Este extintor encontra-se ativo para qualquer opera'#231#227'o'
            TabOrder = 24
          end
          object UniDateTimePicker1: TUniDateTimePicker
            Left = 578
            Top = 106
            Width = 94
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 25
          end
          object UniLabel11: TUniLabel
            Left = 578
            Top = 91
            Width = 44
            Height = 13
            Hint = ''
            Caption = 'Cadastro'
            TabOrder = 26
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Inspe'#231#227'o'
        object UniPanel4: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel12: TUniLabel
            Left = 6
            Top = 7
            Width = 85
            Height = 13
            Hint = ''
            Caption = 'Data da Inspe'#231#227'o'
            TabOrder = 1
          end
          object UniDateTimePicker2: TUniDateTimePicker
            Left = 6
            Top = 23
            Width = 84
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object UniLabel13: TUniLabel
            Left = 92
            Top = 8
            Width = 81
            Height = 13
            Hint = ''
            Caption = 'Data Vencimento'
            TabOrder = 3
          end
          object UniDateTimePicker3: TUniDateTimePicker
            Left = 92
            Top = 23
            Width = 81
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object UniLabel14: TUniLabel
            Left = 175
            Top = 8
            Width = 82
            Height = 13
            Hint = ''
            Caption = 'Recepiente Vazio'
            TabOrder = 5
          end
          object UniEdit11: TUniEdit
            Left = 175
            Top = 23
            Width = 82
            Hint = ''
            Text = ''
            TabOrder = 6
          end
          object UniLabel15: TUniLabel
            Left = 259
            Top = 8
            Width = 108
            Height = 13
            Hint = ''
            Caption = 'Recepiente Carregado'
            TabOrder = 7
          end
          object UniEdit12: TUniEdit
            Left = 259
            Top = 23
            Width = 111
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniLabel16: TUniLabel
            Left = 372
            Top = 8
            Width = 92
            Height = 13
            Hint = ''
            Caption = 'Extintor Carregado'
            TabOrder = 9
          end
          object UniEdit13: TUniEdit
            Left = 372
            Top = 23
            Width = 98
            Hint = ''
            Text = ''
            TabOrder = 10
          end
          object UniLabel17: TUniLabel
            Left = 472
            Top = 8
            Width = 53
            Height = 13
            Hint = ''
            Caption = 'Carga Real'
            TabOrder = 11
          end
          object UniEdit14: TUniEdit
            Left = 472
            Top = 23
            Width = 53
            Hint = ''
            Text = ''
            TabOrder = 12
          end
          object UniLabel18: TUniLabel
            Left = 527
            Top = 8
            Width = 107
            Height = 13
            Hint = ''
            Caption = 'Diferen'#231'a de Carga %'
            TabOrder = 13
          end
          object UniEdit15: TUniEdit
            Left = 527
            Top = 23
            Width = 105
            Hint = ''
            Text = ''
            TabOrder = 14
          end
          object UniLabel19: TUniLabel
            Left = 635
            Top = 26
            Width = 13
            Height = 13
            Hint = ''
            Caption = 'De'
            TabOrder = 15
          end
          object UniEdit16: TUniEdit
            Left = 649
            Top = 23
            Width = 39
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object UniMemo1: TUniMemo
            Left = 6
            Top = 64
            Width = 534
            Height = 104
            Hint = ''
            Lines.Strings = (
              'UniMemo1')
            TabOrder = 17
          end
          object UniLabel20: TUniLabel
            Left = 6
            Top = 49
            Width = 148
            Height = 13
            Hint = ''
            Caption = 'Observa'#231#227'o para este extintor'
            TabOrder = 18
          end
          object UniLabel21: TUniLabel
            Left = 690
            Top = 27
            Width = 17
            Height = 13
            Hint = ''
            Caption = 'At'#233
            TabOrder = 19
          end
          object UniEdit17: TUniEdit
            Left = 710
            Top = 23
            Width = 38
            Hint = ''
            Text = ''
            TabOrder = 20
          end
          object UniLabel22: TUniLabel
            Left = 644
            Top = 8
            Width = 110
            Height = 13
            Hint = ''
            Caption = 'Toler'#226'ncia de Carga %'
            TabOrder = 21
          end
          object UniContainerPanel1: TUniContainerPanel
            Left = 543
            Top = 64
            Width = 208
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 22
          end
        end
      end
      object Manutenção: TUniTabSheet
        Hint = ''
        Caption = 'Manuten'#231#227'o'
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel23: TUniLabel
            Left = 6
            Top = 8
            Width = 103
            Height = 13
            Hint = ''
            Caption = 'Data do '#250'ltimo ensaio'
            TabOrder = 1
          end
          object UniDateTimePicker4: TUniDateTimePicker
            Left = 6
            Top = 23
            Width = 103
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 2
          end
          object UniLabel24: TUniLabel
            Left = 111
            Top = 8
            Width = 104
            Height = 13
            Hint = ''
            Caption = 'Vencimento do ensaio'
            TabOrder = 3
          end
          object UniDateTimePicker5: TUniDateTimePicker
            Left = 111
            Top = 23
            Width = 104
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 4
          end
          object UniContainerPanel2: TUniContainerPanel
            Left = 217
            Top = 4
            Width = 338
            Height = 41
            Hint = ''
            ParentColor = False
            TabOrder = 5
          end
          object UniLabel25: TUniLabel
            Left = 557
            Top = 8
            Width = 70
            Height = 13
            Hint = ''
            Caption = 'Data de Carga'
            TabOrder = 6
          end
          object UniDateTimePicker6: TUniDateTimePicker
            Left = 557
            Top = 23
            Width = 92
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 7
          end
          object UniLabel26: TUniLabel
            Left = 651
            Top = 8
            Width = 100
            Height = 13
            Hint = ''
            Caption = 'Vencimento da carga'
            TabOrder = 8
          end
          object UniDateTimePicker7: TUniDateTimePicker
            Left = 651
            Top = 23
            Width = 100
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 9
          end
          object UniLabel27: TUniLabel
            Left = 6
            Top = 49
            Width = 148
            Height = 13
            Hint = ''
            Caption = 'Observa'#231#227'o para este extintor'
            TabOrder = 10
          end
          object UniMemo2: TUniMemo
            Left = 6
            Top = 64
            Width = 534
            Height = 104
            Hint = ''
            Lines.Strings = (
              'UniMemo1')
            TabOrder = 11
          end
          object UniContainerPanel3: TUniContainerPanel
            Left = 543
            Top = 105
            Width = 208
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 12
          end
          object UniLabel28: TUniLabel
            Left = 543
            Top = 63
            Width = 145
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero do selo na mauten'#231#227'o'
            TabOrder = 13
          end
          object UniEdit18: TUniEdit
            Left = 543
            Top = 79
            Width = 208
            Hint = ''
            Text = ''
            TabOrder = 14
          end
        end
      end
      object UniTabSheet3: TUniTabSheet
        Hint = ''
        Caption = 'Ensaio'
        object UniPanel6: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel29: TUniLabel
            Left = 6
            Top = 8
            Width = 139
            Height = 13
            Hint = ''
            Caption = 'Press'#227'o de trabalho Kmf/cm'#179
            TabOrder = 1
          end
          object UniEdit19: TUniEdit
            Left = 6
            Top = 23
            Width = 139
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniLabel30: TUniLabel
            Left = 147
            Top = 8
            Width = 130
            Height = 13
            Hint = ''
            Caption = 'Press'#227'o de ensaio Kmf/cm'#179
            TabOrder = 3
          end
          object UniEdit20: TUniEdit
            Left = 147
            Top = 23
            Width = 139
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object UniLabel31: TUniLabel
            Left = 288
            Top = 8
            Width = 37
            Height = 13
            Hint = ''
            Caption = 'Tara Kg'
            TabOrder = 5
          end
          object UniEdit21: TUniEdit
            Left = 288
            Top = 23
            Width = 97
            Hint = ''
            Text = ''
            TabOrder = 6
          end
          object UniLabel32: TUniLabel
            Left = 387
            Top = 8
            Width = 45
            Height = 13
            Hint = ''
            Caption = 'Massa Kg'
            TabOrder = 7
          end
          object UniEdit22: TUniEdit
            Left = 387
            Top = 23
            Width = 97
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniEdit23: TUniEdit
            Left = 486
            Top = 23
            Width = 97
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object UniLabel33: TUniLabel
            Left = 486
            Top = 8
            Width = 75
            Height = 13
            Hint = ''
            Caption = 'Perda Massa %'
            TabOrder = 10
          end
          object UniLabel34: TUniLabel
            Left = 585
            Top = 8
            Width = 124
            Height = 13
            Hint = ''
            Caption = 'Toler'#226'nciaPerda Massa %'
            TabOrder = 11
          end
          object UniEdit24: TUniEdit
            Left = 585
            Top = 23
            Width = 136
            Hint = ''
            Text = ''
            TabOrder = 12
          end
          object UniLabel35: TUniLabel
            Left = 6
            Top = 49
            Width = 104
            Height = 13
            Hint = ''
            Caption = 'Recipiente Carregado'
            TabOrder = 13
          end
          object UniEdit25: TUniEdit
            Left = 6
            Top = 64
            Width = 115
            Hint = ''
            Text = ''
            TabOrder = 14
          end
          object UniLabel36: TUniLabel
            Left = 123
            Top = 49
            Width = 105
            Height = 13
            Hint = ''
            Caption = 'Volume Hidr'#225'ulico dm'#179
            TabOrder = 15
          end
          object UniEdit26: TUniEdit
            Left = 123
            Top = 64
            Width = 115
            Hint = ''
            Text = ''
            TabOrder = 16
          end
          object UniLabel37: TUniLabel
            Left = 240
            Top = 49
            Width = 68
            Height = 13
            Hint = ''
            Caption = 'Carga M'#225'xima'
            TabOrder = 17
          end
          object UniEdit27: TUniEdit
            Left = 240
            Top = 64
            Width = 97
            Hint = ''
            Text = ''
            TabOrder = 18
          end
          object UniLabel38: TUniLabel
            Left = 339
            Top = 49
            Width = 95
            Height = 13
            Hint = ''
            Caption = 'Expans'#227'o Total cm'#179
            TabOrder = 19
          end
          object UniEdit28: TUniEdit
            Left = 339
            Top = 64
            Width = 110
            Hint = ''
            Text = ''
            TabOrder = 20
          end
          object UniLabel39: TUniLabel
            Left = 451
            Top = 49
            Width = 129
            Height = 13
            Hint = ''
            Caption = 'Expans'#227'o Permanente cm'#179
            TabOrder = 21
          end
          object UniEdit29: TUniEdit
            Left = 451
            Top = 64
            Width = 142
            Hint = ''
            Text = ''
            TabOrder = 22
          end
          object UniLabel40: TUniLabel
            Left = 595
            Top = 49
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Expans'#227'o %'
            TabOrder = 23
          end
          object UniEdit30: TUniEdit
            Left = 595
            Top = 64
            Width = 77
            Hint = ''
            Text = ''
            TabOrder = 24
          end
        end
      end
      object UniTabSheet4: TUniTabSheet
        Hint = ''
        Caption = 'Lote Agente Extintor'
        object UniPanel7: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel41: TUniLabel
            Left = 6
            Top = 8
            Width = 64
            Height = 13
            Hint = ''
            Caption = 'N'#250'mero Lote '
            TabOrder = 1
          end
          object UniEdit31: TUniEdit
            Left = 6
            Top = 23
            Width = 135
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniLabel42: TUniLabel
            Left = 143
            Top = 8
            Width = 23
            Height = 13
            Hint = ''
            Caption = 'Data'
            TabOrder = 3
          end
          object UniLabel43: TUniLabel
            Left = 230
            Top = 8
            Width = 55
            Height = 13
            Hint = ''
            Caption = 'Vencimento'
            TabOrder = 4
          end
          object UniDateTimePicker8: TUniDateTimePicker
            Left = 143
            Top = 23
            Width = 85
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 5
          end
          object UniDateTimePicker9: TUniDateTimePicker
            Left = 230
            Top = 23
            Width = 85
            Hint = ''
            DateTime = 42978.000000000000000000
            DateFormat = 'dd/MM/yyyy'
            TimeFormat = 'HH:mm:ss'
            TabOrder = 6
          end
          object Ctn_Brand_Lote: TUniContainerPanel
            Left = 317
            Top = 7
            Width = 256
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 7
          end
          object UniLabel44: TUniLabel
            Left = 577
            Top = 8
            Width = 52
            Height = 13
            Hint = ''
            Caption = 'Certificado'
            TabOrder = 8
          end
          object UniEdit32: TUniEdit
            Left = 576
            Top = 23
            Width = 135
            Hint = ''
            Text = ''
            TabOrder = 9
          end
          object UniGroupBox1: TUniGroupBox
            Left = 6
            Top = 49
            Width = 187
            Height = 78
            Hint = ''
            Caption = 'Controle para Agente Reutilizado'
            TabOrder = 10
            object UniButton1: TUniButton
              Left = 5
              Top = 23
              Width = 86
              Height = 45
              Hint = ''
              Caption = 'Inserir'
              TabOrder = 1
            end
            object UniButton2: TUniButton
              Left = 92
              Top = 23
              Width = 86
              Height = 45
              Hint = ''
              Caption = 'Excluir'
              TabOrder = 2
            end
          end
        end
      end
      object UniTabSheet5: TUniTabSheet
        Hint = ''
        Caption = 'Resultado'
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          Caption = ''
          object Aprovado: TUniRadioGroup
            Left = 6
            Top = 4
            Width = 218
            Height = 53
            Hint = ''
            Items.Strings = (
              'Sim'
              'N'#227'o'
              'Avalia'#231#227'o')
            Caption = 'Aprovado'
            TabOrder = 1
            Columns = 3
          end
          object Ctn_Ext_Motive: TUniContainerPanel
            Left = 227
            Top = 14
            Width = 360
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 2
          end
        end
      end
      object UniTabSheet6: TUniTabSheet
        Hint = ''
        Caption = 'Produto'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniDBGrid1: TUniDBGrid
            Left = 2
            Top = 1
            Width = 759
            Height = 120
            Hint = ''
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
          end
          object UniGroupBox2: TUniGroupBox
            Left = 3
            Top = 123
            Width = 759
            Height = 66
            Hint = ''
            Caption = ''
            TabOrder = 2
            DesignSize = (
              759
              66)
            object UniSpeedButton1: TUniSpeedButton
              Left = 277
              Top = 5
              Width = 93
              Height = 54
              Hint = ''
              Caption = 'Informar Lote'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 1
              OnClick = SB_SaveClick
            end
            object UniSpeedButton2: TUniSpeedButton
              Left = 184
              Top = 5
              Width = 93
              Height = 54
              Hint = ''
              Caption = 'Excluir'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 2
              OnClick = SB_DeleteClick
            end
            object UniSpeedButton3: TUniSpeedButton
              Left = 93
              Top = 5
              Width = 91
              Height = 54
              Hint = ''
              Caption = 'Alterar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 3
              OnClick = SB_ChangeClick
            end
            object UniSpeedButton4: TUniSpeedButton
              Left = 2
              Top = 5
              Width = 91
              Height = 54
              Hint = ''
              Caption = 'Novo'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 4
              OnClick = SB_InsertClick
            end
          end
        end
      end
      object UniTabSheet7: TUniTabSheet
        Hint = ''
        Caption = 'Servi'#231'os'
        object UniPanel8: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          Caption = ''
          object UniDBGrid2: TUniDBGrid
            Left = 2
            Top = 1
            Width = 759
            Height = 125
            Hint = ''
            LoadMask.Message = 'Loading data...'
            TabOrder = 1
          end
          object UniGroupBox3: TUniGroupBox
            Left = 2
            Top = 128
            Width = 759
            Height = 66
            Hint = ''
            Caption = ''
            TabOrder = 2
            DesignSize = (
              759
              66)
            object UniSpeedButton6: TUniSpeedButton
              Left = 184
              Top = 5
              Width = 93
              Height = 54
              Hint = ''
              Caption = 'Excluir'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 1
              OnClick = SB_DeleteClick
            end
            object UniSpeedButton7: TUniSpeedButton
              Left = 93
              Top = 5
              Width = 91
              Height = 54
              Hint = ''
              Caption = 'Alterar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 2
              OnClick = SB_ChangeClick
            end
            object UniSpeedButton8: TUniSpeedButton
              Left = 2
              Top = 5
              Width = 91
              Height = 54
              Hint = ''
              Caption = 'Novo'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              TabOrder = 3
              OnClick = SB_InsertClick
            end
          end
        end
      end
      object UniTabSheet8: TUniTabSheet
        Hint = ''
        Caption = 'Observa'#231#227'o da Ordem de Servi'#231'o'
        object UniPanel9: TUniPanel
          Left = 0
          Top = 0
          Width = 764
          Height = 194
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniMemo3: TUniMemo
            Left = 2
            Top = 2
            Width = 760
            Height = 190
            Hint = ''
            Lines.Strings = (
              'UniMemo3')
            Align = alClient
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 152
    Top = 184
  end
end
