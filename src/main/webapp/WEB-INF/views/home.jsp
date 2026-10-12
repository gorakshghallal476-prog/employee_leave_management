<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Leave Management System</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">

    <style>
        /* =========================
           GLOBAL STYLES
        ========================= */

        :root {
            --background: #090d0b;
            --surface: #101512;
            --surface-light: #141a16;
            --border: #29312b;
            --green: #b4ff3c;
            --green-dark: #8de51b;
            --text: #f5f7f5;
            --muted: #89958b;
            --blue-gray: #a2adb9;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 100px;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--background);
            color: var(--text);
            min-height: 100vh;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        a {
            -webkit-tap-highlight-color: transparent;
        }

        button {
            font-family: inherit;
        }

        .container {
            width: min(1470px, 90%);
            margin: auto;
        }

        /* =========================
           NAVIGATION BAR
        ========================= */

        .navbar {
            height: 82px;
            display: flex;
            align-items: center;
            border-bottom: 1px solid #252c27;
            background: rgba(9, 13, 11, 0.96);
            position: sticky;
            top: 0;
            z-index: 1000;
            backdrop-filter: blur(18px);
        }

        .nav-inner {
            width: min(1470px, 90%);
            margin: auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 13px;
            flex-shrink: 0;
        }

        .brand-logo {
            width: 46px;
            height: 46px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--green);
            color: #080c07;
            border-radius: 12px;
            font-size: 19px;
            font-weight: 800;
            box-shadow: 0 0 25px rgba(180, 255, 60, 0.12);
        }

        .brand-name {
            font-size: 18px;
            font-weight: 700;
            letter-spacing: -0.6px;
            white-space: nowrap;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 36px;
        }

        .nav-links a {
            font-size: 14px;
            color: #b5bec5;
            transition: color 0.25s;
            position: relative;
            padding: 10px 0;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: var(--green);
        }

        .nav-links a.active::after {
            content: "";
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 100%;
            height: 2px;
            background: var(--green);
        }

        .nav-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            min-height: 53px;
            padding: 0 25px;
            border-radius: 11px;
            border: 1px solid transparent;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: transform 0.25s,
                        background 0.25s,
                        border-color 0.25s,
                        box-shadow 0.25s;
        }

        .btn:hover {
            transform: translateY(-3px);
        }

        .btn-green {
            background: var(--green);
            color: #080c07;
            box-shadow: 0 5px 25px rgba(180, 255, 60, 0.10);
        }

        .btn-green:hover {
            background: #c4ff68;
            box-shadow: 0 8px 30px rgba(180, 255, 60, 0.20);
        }

        .btn-outline {
            background: transparent;
            border-color: #414a44;
            color: var(--text);
        }

        .btn-outline:hover {
            border-color: var(--green);
            background: rgba(180, 255, 60, 0.04);
        }

        .btn-arrow {
            font-size: 21px;
            line-height: 1;
        }

        .menu-toggle {
            display: none;
            width: 43px;
            height: 43px;
            background: var(--surface);
            color: var(--text);
            border: 1px solid var(--border);
            border-radius: 9px;
            font-size: 23px;
            cursor: pointer;
        }

        /* =========================
           HERO SECTION
        ========================= */

        .hero {
            position: relative;
            padding: 55px 0 45px;
            isolation: isolate;
        }

        .hero::before {
            content: "";
            position: absolute;
            top: 40px;
            left: 25%;
            width: 550px;
            height: 550px;
            border-radius: 50%;
            background: rgba(71, 137, 25, 0.07);
            filter: blur(110px);
            z-index: -1;
            pointer-events: none;
        }

        .hero-grid {
            display: grid;
            grid-template-columns: 0.88fr 1.12fr;
            gap: 48px;
            align-items: center;
        }

        .hero-content {
            padding: 15px 0 20px;
            min-width: 0;
        }

        .eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 11px 15px;
            background: rgba(180, 255, 60, 0.08);
            border: 1px solid rgba(180, 255, 60, 0.08);
            border-radius: 40px;
            color: var(--green);
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 2px;
            margin-bottom: 29px;
        }

        .eyebrow-dot {
            width: 8px;
            height: 8px;
            background: var(--green);
            border-radius: 50%;
            box-shadow: 0 0 12px var(--green);
        }

        .hero h1 {
            font-size: clamp(38px, 4vw, 65px);
            line-height: 1.12;
            font-weight: 800;
            letter-spacing: -2.5px;
            margin-bottom: 25px;
        }

        .hero-description {
            color: var(--blue-gray);
            font-size: 17px;
            line-height: 1.85;
            max-width: 570px;
            margin-bottom: 29px;
        }

        .hero-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 17px;
            margin-bottom: 45px;
        }

        .hero-buttons .btn {
            min-width: 190px;
            min-height: 62px;
            font-size: 15px;
        }

        .benefits {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 17px;
        }

        .benefit {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            color: #c3cbd0;
            font-size: 12px;
            line-height: 1.7;
        }

        .check-box {
            flex-shrink: 0;
            width: 36px;
            height: 36px;
            border: 1px solid #34521d;
            border-radius: 10px;
            background: rgba(180, 255, 60, 0.08);
            color: var(--green);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 19px;
            font-weight: 800;
        }

        /* =========================
           DASHBOARD PREVIEW
        ========================= */

        .dashboard-wrap {
            position: relative;
            min-width: 0;
            perspective: 1200px;
        }

        .dashboard-glow {
            position: absolute;
            inset: 5% -2%;
            background: rgba(95, 190, 29, 0.09);
            filter: blur(65px);
            z-index: -1;
        }

        .dashboard {
            background: #0c110e;
            border: 1px solid #345022;
            border-radius: 17px;
            padding: 14px;
            transform: rotateY(-2deg);
            box-shadow:
                0 0 0 1px rgba(180, 255, 60, 0.025),
                0 20px 70px rgba(0, 0, 0, 0.35),
                0 0 45px rgba(96, 171, 37, 0.07);
            overflow: hidden;
        }

        .dashboard-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 8px 8px 16px;
            border-bottom: 1px solid #202722;
        }

        .mini-brand {
            display: flex;
            align-items: center;
            gap: 9px;
            font-size: 12px;
            font-weight: 700;
            min-width: 0;
        }

        .mini-logo {
            width: 30px;
            height: 30px;
            background: var(--green);
            color: #080c07;
            border-radius: 8px;
            display: grid;
            place-items: center;
            font-weight: 800;
            flex-shrink: 0;
        }

        .mini-brand span:last-child {
            overflow-wrap: anywhere;
        }

        .dashboard-user {
            display: flex;
            align-items: center;
            gap: 9px;
            flex-shrink: 0;
        }

        .avatar {
            width: 32px;
            height: 32px;
            display: grid;
            place-items: center;
            background: #1a2a13;
            border: 1px solid #38551f;
            color: var(--green);
            border-radius: 50%;
            font-size: 12px;
            font-weight: 700;
        }

        .user-label {
            font-size: 10px;
            font-weight: 700;
        }

        .user-label small {
            display: block;
            color: var(--muted);
            font-size: 9px;
            font-weight: 400;
            margin-top: 4px;
        }

        .dashboard-layout {
            display: grid;
            grid-template-columns: 125px minmax(0, 1fr);
            gap: 15px;
            padding-top: 15px;
        }

        .dashboard-sidebar {
            display: flex;
            flex-direction: column;
            gap: 5px;
            padding-top: 5px;
            border-right: 1px solid #202722;
            padding-right: 10px;
        }

        .side-link {
            display: flex;
            align-items: center;
            gap: 9px;
            padding: 11px 8px;
            color: #a4aea7;
            border-radius: 7px;
            font-size: 10px;
            white-space: nowrap;
        }

        .side-link .side-icon {
            width: 14px;
            text-align: center;
            font-size: 12px;
        }

        .side-link.active {
            background: rgba(180, 255, 60, 0.12);
            color: var(--green);
        }

        .side-link:hover {
            color: var(--green);
            background: rgba(180, 255, 60, 0.05);
        }

        .side-divider {
            height: 1px;
            background: #202722;
            margin: 12px 0;
        }

        .dashboard-main {
            min-width: 0;
        }

        .dashboard-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            margin-bottom: 17px;
        }

        .dashboard-heading h3 {
            font-size: 16px;
            margin-bottom: 6px;
        }

        .dashboard-heading p {
            color: var(--muted);
            font-size: 10px;
            line-height: 1.5;
        }

        .date-badge {
            padding: 10px;
            border: 1px solid #29312b;
            border-radius: 8px;
            color: #d1d7d1;
            font-size: 10px;
            white-space: nowrap;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 10px;
            margin-bottom: 16px;
        }

        .stat-card {
            padding: 12px 10px;
            border: 1px solid #252d27;
            border-radius: 11px;
            background: linear-gradient(145deg, #131915, #0d120f);
            min-width: 0;
        }

        .stat-icon {
            width: 31px;
            height: 31px;
            display: grid;
            place-items: center;
            color: var(--green);
            border: 1px solid #30451e;
            border-radius: 8px;
            background: rgba(180, 255, 60, 0.07);
            margin-bottom: 11px;
            font-size: 15px;
        }

        .stat-title {
            color: #a4afa6;
            font-size: 10px;
            line-height: 1.5;
            margin-bottom: 5px;
            overflow-wrap: anywhere;
        }

        .stat-number {
            font-size: clamp(18px, 2vw, 26px);
            font-weight: 800;
            letter-spacing: -0.8px;
            margin-bottom: 6px;
            overflow-wrap: anywhere;
        }

        .stat-foot {
            color: #839087;
            font-size: 9px;
            line-height: 1.4;
        }

        /* Recent leave table */

        .requests-panel {
            border: 1px solid #252d27;
            border-radius: 11px;
            overflow: hidden;
            background: #101512;
        }

        .requests-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 10px;
            padding: 13px;
            border-bottom: 1px solid #252d27;
        }

        .requests-header h4 {
            font-size: 12px;
            margin-bottom: 5px;
        }

        .requests-header p {
            color: var(--muted);
            font-size: 9px;
        }

        .view-all {
            font-size: 10px;
            color: #b8c7b9;
            white-space: nowrap;
        }

        .view-all:hover {
            color: var(--green);
        }

        .table-scroll {
            width: 100%;
            overflow-x: auto;
        }

        .leave-table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            white-space: nowrap;
        }

        .leave-table th {
            padding: 12px 9px;
            color: #89968b;
            font-size: 8px;
            font-weight: 600;
            letter-spacing: 0.8px;
            border-bottom: 1px solid #252d27;
        }

        .leave-table td {
            padding: 12px 9px;
            font-size: 9px;
            color: #c7d0c9;
            border-bottom: 1px solid #202722;
        }

        .leave-table tbody tr:last-child td {
            border-bottom: none;
        }

        .leave-table tbody tr:hover {
            background: rgba(180, 255, 60, 0.025);
        }

        .employee-name {
            color: #f0f3f0 !important;
            font-weight: 600;
        }

        .status {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 9px;
            border-radius: 30px;
            font-size: 9px;
            font-weight: 600;
            border: 1px solid;
        }

        .status::before {
            content: "";
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: currentColor;
        }

        .pending {
            color: #ffd24b;
            background: rgba(255, 210, 75, 0.08);
            border-color: rgba(255, 210, 75, 0.2);
        }

        .approved {
            color: #42e88a;
            background: rgba(66, 232, 138, 0.08);
            border-color: rgba(66, 232, 138, 0.2);
        }

        .rejected {
            color: #ff6b6b;
            background: rgba(255, 107, 107, 0.08);
            border-color: rgba(255, 107, 107, 0.2);
        }

        /* =========================
           FEATURE CARDS
        ========================= */

        .features {
            padding: 5px 0 65px;
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 18px;
        }

        .feature-card {
            display: flex;
            align-items: center;
            gap: 20px;
            padding: 25px;
            background: linear-gradient(135deg, #101512, #0c100e);
            border: 1px solid #29312b;
            border-radius: 13px;
            transition: border-color 0.3s,
                        transform 0.3s,
                        background 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            border-color: #4a682e;
            background: #121914;
        }

        .feature-icon {
            width: 64px;
            height: 64px;
            flex-shrink: 0;
            display: grid;
            place-items: center;
            background: rgba(180, 255, 60, 0.08);
            border: 1px solid #385522;
            border-radius: 13px;
            color: var(--green);
            font-size: 27px;
        }

        .feature-content {
            flex: 1;
            min-width: 0;
        }

        .feature-content h3 {
            font-size: 15px;
            margin-bottom: 9px;
            line-height: 1.5;
        }

        .feature-content p {
            color: var(--blue-gray);
            font-size: 12px;
            line-height: 1.8;
        }

        .feature-arrow {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            flex-shrink: 0;
            border: 1px solid #303832;
            border-radius: 50%;
            color: #dbe3dc;
            transition: all 0.25s;
        }

        .feature-card:hover .feature-arrow {
            background: var(--green);
            border-color: var(--green);
            color: #080c07;
        }

        /* =========================
           HOW IT WORKS
        ========================= */

        .how-section {
            padding: 55px 0 75px;
            border-top: 1px solid #202722;
            background: radial-gradient(
                ellipse at top,
                rgba(80, 137, 38, 0.06),
                transparent 65%
            );
        }

        .section-heading {
            text-align: center;
            max-width: 650px;
            margin: 0 auto 40px;
        }

        .section-heading .eyebrow {
            margin-bottom: 18px;
        }

        .section-heading h2 {
            font-size: clamp(27px, 4vw, 40px);
            letter-spacing: -1px;
            margin-bottom: 14px;
        }

        .section-heading p {
            color: var(--blue-gray);
            font-size: 14px;
            line-height: 1.8;
        }

        .steps-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 20px;
        }

        .step-card {
            padding: 27px;
            border: 1px solid var(--border);
            background: var(--surface);
            border-radius: 13px;
        }

        .step-number {
            width: 42px;
            height: 42px;
            display: grid;
            place-items: center;
            background: rgba(180, 255, 60, 0.08);
            border: 1px solid #385522;
            color: var(--green);
            border-radius: 11px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        .step-card h3 {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .step-card p {
            color: var(--blue-gray);
            font-size: 13px;
            line-height: 1.8;
        }

        /* =========================
           ABOUT SECTION
        ========================= */

        .about-section {
            padding: 65px 0;
            border-top: 1px solid #202722;
        }

        .about-box {
            max-width: 900px;
            margin: auto;
            padding: 38px;
            border: 1px solid var(--border);
            border-radius: 16px;
            background: linear-gradient(135deg, #121813, #0c100e);
            text-align: center;
        }

        .about-box h2 {
            font-size: 30px;
            margin-bottom: 18px;
            letter-spacing: -1px;
        }

        .about-box p {
            max-width: 700px;
            margin: auto;
            color: var(--blue-gray);
            line-height: 1.9;
            font-size: 14px;
        }

        /* =========================
           FOOTER
        ========================= */

        .footer {
            border-top: 1px solid #252c27;
            padding: 25px 0;
        }

        .footer-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 18px;
        }

        .footer p {
            color: var(--muted);
            font-size: 12px;
            line-height: 1.7;
        }

        .footer-links {
            display: flex;
            gap: 22px;
            flex-wrap: wrap;
        }

        .footer-links a {
            color: #aab4ac;
            font-size: 12px;
        }

        .footer-links a:hover {
            color: var(--green);
        }

        /* =========================
           ANIMATIONS
        ========================= */

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(18px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-content,
        .dashboard-wrap {
            animation: fadeUp 0.7s ease both;
        }

        .dashboard-wrap {
            animation-delay: 0.12s;
        }

        .feature-card {
            animation: fadeUp 0.5s ease both;
        }

        .feature-card:nth-child(2) {
            animation-delay: 0.1s;
        }

        .feature-card:nth-child(3) {
            animation-delay: 0.2s;
        }

        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                transition-duration: 0.01ms !important;
                scroll-behavior: auto !important;
            }
        }

        /* =========================
           RESPONSIVE DESIGN
        ========================= */

        @media (min-width: 1600px) {
            .hero {
                padding-top: 70px;
            }

            .hero-grid {
                gap: 60px;
            }
        }

        @media (max-width: 1250px) {
            .nav-links {
                gap: 22px;
            }

            .hero-grid {
                grid-template-columns: 0.85fr 1.15fr;
                gap: 30px;
            }

            .hero h1 {
                font-size: 46px;
                letter-spacing: -1.8px;
            }

            .dashboard-layout {
                grid-template-columns: 108px minmax(0, 1fr);
                gap: 10px;
            }

            .feature-card {
                padding: 20px;
                gap: 14px;
            }

            .feature-icon {
                width: 52px;
                height: 52px;
            }
        }

        @media (max-width: 1000px) {
            .nav-inner {
                gap: 15px;
            }

            .brand-name {
                font-size: 15px;
            }

            .nav-links {
                gap: 15px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .nav-actions {
                gap: 9px;
            }

            .nav-actions .btn {
                padding: 0 15px;
                min-height: 45px;
                font-size: 12px;
            }

            .hero-grid {
                grid-template-columns: 1fr;
                gap: 35px;
            }

            .hero-content {
                max-width: 720px;
            }

            .hero h1 {
                font-size: clamp(42px, 6vw, 62px);
            }

            .hero-description {
                max-width: 650px;
            }

            .dashboard {
                transform: none;
            }

            .dashboard-layout {
                grid-template-columns: 150px minmax(0, 1fr);
            }

            .stats-grid {
                grid-template-columns: repeat(4, minmax(0, 1fr));
            }

            .feature-grid {
                gap: 12px;
            }

            .feature-card {
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .feature-arrow {
                margin-left: auto;
            }
        }

        @media (max-width: 760px) {
            .navbar {
                height: 72px;
            }

            .nav-inner {
                width: 92%;
            }

            .brand-logo {
                width: 40px;
                height: 40px;
            }

            .brand-name {
                white-space: normal;
                max-width: 200px;
                line-height: 1.4;
            }

            .menu-toggle {
                display: block;
                flex-shrink: 0;
            }

            .nav-inner {
                position: relative;
            }

            .nav-links {
                display: none;
                position: absolute;
                top: 58px;
                left: 0;
                right: 0;
                padding: 15px;
                border: 1px solid var(--border);
                border-radius: 12px;
                background: #101512;
                flex-direction: column;
                align-items: stretch;
                gap: 4px;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.35);
            }

            .nav-links.open {
                display: flex;
            }

            .nav-links a {
                padding: 12px;
                font-size: 14px;
            }

            .nav-links a.active::after {
                display: none;
            }

            .nav-actions .btn-outline {
                display: none;
            }

            .nav-actions .btn-green {
                min-height: 42px;
                padding: 0 13px;
                font-size: 11px;
            }

            .hero {
                padding-top: 40px;
            }

            .container {
                width: 92%;
            }

            .hero h1 {
                font-size: clamp(37px, 8vw, 53px);
                letter-spacing: -1.8px;
            }

            .hero-description {
                font-size: 15px;
            }

            .benefits {
                gap: 10px;
            }

            .benefit {
                flex-direction: column;
                font-size: 11px;
            }

            .dashboard {
                padding: 9px;
            }

            .dashboard-layout {
                grid-template-columns: 100px minmax(0, 1fr);
                gap: 9px;
            }

            .dashboard-sidebar {
                padding-right: 6px;
            }

            .side-link {
                padding: 9px 5px;
                font-size: 9px;
                gap: 5px;
            }

            .side-link .side-icon {
                font-size: 10px;
                width: 12px;
            }

            .stats-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .stat-number {
                font-size: 23px;
            }

            .feature-grid {
                grid-template-columns: 1fr;
            }

            .feature-card {
                align-items: center;
                flex-wrap: nowrap;
            }

            .feature-arrow {
                margin-left: 0;
            }

            .steps-grid {
                grid-template-columns: 1fr;
            }

            .about-box {
                padding: 28px 20px;
            }

            .about-box h2 {
                font-size: 25px;
            }
        }

        @media (max-width: 480px) {
            .brand-name {
                font-size: 12px;
                max-width: 125px;
            }

            .brand {
                gap: 8px;
            }

            .brand-logo {
                width: 36px;
                height: 36px;
                font-size: 16px;
            }

            .nav-actions .btn-green {
                padding: 0 10px;
                gap: 5px;
            }

            .menu-toggle {
                width: 36px;
                height: 36px;
            }

            .hero {
                padding-top: 30px;
            }

            .eyebrow {
                font-size: 9px;
                letter-spacing: 1px;
                padding: 9px 11px;
                gap: 8px;
                margin-bottom: 22px;
            }

            .hero h1 {
                font-size: 37px;
                letter-spacing: -1.5px;
            }

            .hero-description {
                font-size: 14px;
                line-height: 1.8;
            }

            .hero-buttons {
                gap: 10px;
                margin-bottom: 30px;
            }

            .hero-buttons .btn {
                min-width: 0;
                flex: 1;
                padding: 0 12px;
                min-height: 52px;
                font-size: 12px;
                gap: 7px;
            }

            .benefits {
                grid-template-columns: 1fr;
                gap: 12px;
            }

            .benefit {
                flex-direction: row;
                align-items: center;
            }

            .check-box {
                width: 32px;
                height: 32px;
            }

            .dashboard-top {
                align-items: flex-start;
            }

            .mini-brand {
                font-size: 9px;
            }

            .mini-logo {
                width: 25px;
                height: 25px;
            }

            .dashboard-user {
                gap: 5px;
            }

            .user-label {
                display: none;
            }

            .dashboard-layout {
                grid-template-columns: 1fr;
            }

            .dashboard-sidebar {
                display: grid;
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 5px;
                border-right: none;
                border-bottom: 1px solid #202722;
                padding: 0 0 10px;
            }

            .side-link {
                justify-content: center;
                font-size: 9px;
            }

            .side-divider {
                display: none;
            }

            .dashboard-heading h3 {
                font-size: 14px;
            }

            .dashboard-heading p {
                font-size: 9px;
            }

            .date-badge {
                padding: 8px 6px;
                font-size: 9px;
            }

            .stat-card {
                padding: 11px;
            }

            .requests-header {
                padding: 11px;
            }

            .leave-table th,
            .leave-table td {
                padding: 10px 8px;
            }

            .feature-card {
                padding: 17px;
                gap: 12px;
            }

            .feature-icon {
                width: 45px;
                height: 45px;
                font-size: 22px;
            }

            .feature-content h3 {
                font-size: 13px;
            }

            .feature-content p {
                font-size: 11px;
            }

            .feature-arrow {
                width: 34px;
                height: 34px;
            }

            .footer-inner {
                flex-direction: column;
                align-items: flex-start;
            }

            .footer-links {
                gap: 15px;
            }
        }
    </style>
</head>

<body>

<%
    String contextPath = request.getContextPath();
%>

<!-- =========================
     NAVIGATION BAR
========================= -->

<header class="navbar">
    <div class="nav-inner">

        <a href="#home" class="brand" aria-label="Employee Leave Management System Home">
            <div class="brand-logo">EM</div>
            <span class="brand-name">Employee Leave Management System</span>
        </a>

        <nav class="nav-links" id="navLinks">

            <a href="#home" class="active">Home</a>

            <a href="#features">Features</a>

            <a href="#how-it-works">How It Works</a>

            <a href="#about">About</a>

        </nav>

        <div class="nav-actions">

            <a href="<%= contextPath %>/login" class="btn btn-outline">
                <span aria-hidden="true">♙</span>
                Sign In
            </a>

            <a href="<%= contextPath %>/login" class="btn btn-green">
                Get Started
                <span class="btn-arrow" aria-hidden="true">→</span>
            </a>

            <button class="menu-toggle"
                    id="menuToggle"
                    type="button"
                    aria-label="Toggle navigation"
                    aria-expanded="false">
                ☰
            </button>

        </div>

    </div>
</header>


<!-- =========================
     HERO SECTION
========================= -->

<main>

<section class="hero" id="home">

    <div class="container">

        <div class="hero-grid">

            <!-- LEFT SIDE -->

            <div class="hero-content">

                <div class="eyebrow">
                    <span class="eyebrow-dot"></span>
                    EMPLOYEE LEAVE MANAGEMENT SYSTEM
                </div>

                <h1>
                    Employee Leave<br>
                    Management System
                </h1>

                <p class="hero-description">
                    A centralized platform for managing employees,
                    departments, leave requests, attendance and payroll
                    in one place.
                </p>

                <div class="hero-buttons">

                    <a href="<%= contextPath %>/login" class="btn btn-green">
                        Get Started
                        <span class="btn-arrow" aria-hidden="true">→</span>
                    </a>

                    <a href="#features" class="btn btn-outline">
                        Explore Features
                        <span class="btn-arrow" aria-hidden="true">→</span>
                    </a>

                </div>

                <div class="benefits">

                    <div class="benefit">
                        <div class="check-box">✓</div>
                        <span>
                            Employee and department management
                        </span>
                    </div>

                    <div class="benefit">
                        <div class="check-box">✓</div>
                        <span>
                            Leave application and approval
                        </span>
                    </div>

                    <div class="benefit">
                        <div class="check-box">✓</div>
                        <span>
                            Payroll and salary management
                        </span>
                    </div>

                </div>

            </div>


            <!-- RIGHT SIDE: DASHBOARD PREVIEW -->

            <div class="dashboard-wrap">

                <div class="dashboard-glow"></div>

                <div class="dashboard">

                    <!-- Dashboard top bar -->

                    <div class="dashboard-top">

                        <div class="mini-brand">
                            <span class="mini-logo">EM</span>
                            <span>Employee Leave Management System</span>
                        </div>

                        <div class="dashboard-user">

                            <div class="avatar">A</div>

                            <div class="user-label">
                                Admin
                                <small>Administrator</small>
                            </div>

                        </div>

                    </div>


                    <div class="dashboard-layout">

                        <!-- Sidebar -->

                        <aside class="dashboard-sidebar">

                            <a href="<%= contextPath %>/admin"
                               class="side-link active">
                                <span class="side-icon">▦</span>
                                Dashboard
                            </a>

                            <a href="<%= contextPath %>/employees"
                               class="side-link">
                                <span class="side-icon">♙</span>
                                Employees
                            </a>

                            <a href="<%= contextPath %>/departments"
                               class="side-link">
                                <span class="side-icon">▤</span>
                                Departments
                            </a>

                            <a href="<%= contextPath %>/leave-types"
                               class="side-link">
                                <span class="side-icon">◈</span>
                                Leave Types
                            </a>

                            <a href="<%= contextPath %>/leaves"
                               class="side-link">
                                <span class="side-icon">◷</span>
                                Leave Requests
                            </a>

                            <a href="<%= contextPath %>/payroll"
                               class="side-link">
                                <span class="side-icon">₹</span>
                                Payroll
                            </a>

                            <a href="<%= contextPath %>/admin"
                               class="side-link">
                                <span class="side-icon">▥</span>
                                Reports
                            </a>

                            <div class="side-divider"></div>

                            <a href="<%= contextPath %>/login"
                               class="side-link">
                                <span class="side-icon">⚙</span>
                                Settings
                            </a>

                        </aside>


                        <!-- Dashboard main content -->

                        <div class="dashboard-main">

                            <div class="dashboard-heading">

                                <div>
                                    <h3>Admin Dashboard</h3>

                                    <p>
                                        Here's what's happening with your
                                        organization today.
                                    </p>
                                </div>

                                <div class="date-badge">
                                    ▣ &nbsp; September 2026
                                </div>

                            </div>


                            <!-- Statistics cards -->

                            <div class="stats-grid">

                                <div class="stat-card">

                                    <div class="stat-icon">♙</div>

                                    <div class="stat-title">
                                        Total Employees
                                    </div>

                                    <div class="stat-number">9</div>

                                    <div class="stat-foot">
                                        Organization employees
                                    </div>

                                </div>


                                <div class="stat-card">

                                    <div class="stat-icon">▤</div>

                                    <div class="stat-title">
                                        Departments
                                    </div>

                                    <div class="stat-number">3</div>

                                    <div class="stat-foot">
                                        Active departments
                                    </div>

                                </div>


                                <div class="stat-card">

                                    <div class="stat-icon">◷</div>

                                    <div class="stat-title">
                                        Pending Leaves
                                    </div>

                                    <div class="stat-number">3</div>

                                    <div class="stat-foot">
                                        Requires attention
                                    </div>

                                </div>


                                <div class="stat-card">

                                    <div class="stat-icon">₹</div>

                                    <div class="stat-title">
                                        Monthly Collection
                                    </div>

                                    <div class="stat-number">₹12.8L</div>

                                    <div class="stat-foot">
                                        Current month
                                    </div>

                                </div>

                            </div>


                            <!-- Recent leave requests -->

                            <div class="requests-panel">

                                <div class="requests-header">

                                    <div>
                                        <h4>Recent Leave Requests</h4>

                                        <p>
                                            Latest leave activity from employees
                                        </p>
                                    </div>

                                    <a href="<%= contextPath %>/leaves"
                                       class="view-all">
                                        View All →
                                    </a>

                                </div>


                                <div class="table-scroll">

                                    <table class="leave-table">

                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>EMPLOYEE</th>
                                                <th>LEAVE TYPE</th>
                                                <th>DURATION</th>
                                                <th>STATUS</th>
                                            </tr>
                                        </thead>

                                        <tbody>

                                            <tr>
                                                <td>01</td>
                                                <td class="employee-name">
                                                    Rahul Sharma
                                                </td>
                                                <td>Casual Leave</td>
                                                <td>20 Sep - 22 Sep</td>
                                                <td>
                                                    <span class="status pending">
                                                        Pending
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>02</td>
                                                <td class="employee-name">
                                                    Priya Patil
                                                </td>
                                                <td>Sick Leave</td>
                                                <td>18 Sep - 19 Sep</td>
                                                <td>
                                                    <span class="status approved">
                                                        Approved
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>03</td>
                                                <td class="employee-name">
                                                    Amit Kulkarni
                                                </td>
                                                <td>Earned Leave</td>
                                                <td>24 Sep - 26 Sep</td>
                                                <td>
                                                    <span class="status rejected">
                                                        Rejected
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>04</td>
                                                <td class="employee-name">
                                                    Sneha Joshi
                                                </td>
                                                <td>Casual Leave</td>
                                                <td>15 Sep - 16 Sep</td>
                                                <td>
                                                    <span class="status approved">
                                                        Approved
                                                    </span>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>05</td>
                                                <td class="employee-name">
                                                    Rohan Deshmukh
                                                </td>
                                                <td>Sick Leave</td>
                                                <td>12 Sep - 14 Sep</td>
                                                <td>
                                                    <span class="status pending">
                                                        Pending
                                                    </span>
                                                </td>
                                            </tr>

                                        </tbody>

                                    </table>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>


<!-- =========================
     FEATURE CARDS
========================= -->

<section class="features" id="features">

    <div class="container">

        <div class="feature-grid">


            <!-- Employee Management -->

            <a href="#about" class="feature-card">

                <div class="feature-icon">♙</div>

                <div class="feature-content">

                    <h3>Employee Management</h3>

                    <p>
                        Maintain employee records, departments
                        and roles with ease.
                    </p>

                </div>

                <div class="feature-arrow">→</div>

            </a>


            <!-- Leave Management -->

            <a href="#how-it-works" class="feature-card">

                <div class="feature-icon">▦</div>

                <div class="feature-content">

                    <h3>Leave Requests &amp; Approvals</h3>

                    <p>
                        Streamlined leave workflow with
                        transparent tracking and notifications.
                    </p>

                </div>

                <div class="feature-arrow">→</div>

            </a>


            <!-- Payroll -->

            <a href="<%= contextPath %>/payroll" class="feature-card">

                <div class="feature-icon">▥</div>

                <div class="feature-content">

                    <h3>Payroll &amp; Reports</h3>

                    <p>
                        Generate payroll and insightful reports
                        for better workforce management.
                    </p>

                </div>

                <div class="feature-arrow">→</div>

            </a>


        </div>

    </div>

</section>


<!-- =========================
     HOW IT WORKS
========================= -->

<section class="how-section" id="how-it-works">

    <div class="container">

        <div class="section-heading">

            <div class="eyebrow">
                <span class="eyebrow-dot"></span>
                SIMPLE WORKFLOW
            </div>

            <h2>How It Works</h2>

            <p>
                Manage your employee leave workflow through
                a clear and organized process.
            </p>

        </div>


        <div class="steps-grid">

            <div class="step-card">

                <div class="step-number">01</div>

                <h3>Manage Employees</h3>

                <p>
                    Organize employee information, departments,
                    roles and employee records from one place.
                </p>

            </div>


            <div class="step-card">

                <div class="step-number">02</div>

                <h3>Apply for Leave</h3>

                <p>
                    Employees can submit leave requests and
                    check their leave balances and request status.
                </p>

            </div>


            <div class="step-card">

                <div class="step-number">03</div>

                <h3>Review and Approve</h3>

                <p>
                    Authorized users can review leave requests
                    and manage approvals through the system.
                </p>

            </div>

        </div>

    </div>

</section>


<!-- =========================
     ABOUT SECTION
========================= -->

<section class="about-section" id="about">

    <div class="container">

        <div class="about-box">

            <div class="eyebrow">
                <span class="eyebrow-dot"></span>
                ABOUT THE PROJECT
            </div>

            <h2>Employee Leave Management System</h2>

            <p>
                The Employee Leave Management System is designed
                to organize employee information, simplify leave
                applications and approvals, manage departments,
                and support payroll operations through a centralized
                application.
            </p>

        </div>

    </div>

</section>

</main>


<!-- =========================
     FOOTER
========================= -->

<footer class="footer">

    <div class="container">

        <div class="footer-inner">

            <div class="brand">

                <div class="brand-logo">EM</div>

                <span class="brand-name">
                    Employee Leave Management System
                </span>

            </div>

            <p>
                &copy; 2026 Employee Leave Management System.
                All rights reserved.
            </p>

            <div class="footer-links">

                <a href="#home">Home</a>

                <a href="#features">Features</a>

                <a href="#about">About</a>

                <a href="<%= contextPath %>/login">Sign In</a>

            </div>

        </div>

    </div>

</footer>


<!-- =========================
     MOBILE NAVIGATION SCRIPT
========================= -->

<script>
    const menuToggle = document.getElementById("menuToggle");
    const navLinks = document.getElementById("navLinks");

    menuToggle.addEventListener("click", function () {

        const isOpen = navLinks.classList.toggle("open");

        menuToggle.setAttribute("aria-expanded", isOpen);

        menuToggle.textContent = isOpen ? "✕" : "☰";

    });

    // Close the mobile menu after selecting a navigation link.

    document.querySelectorAll("#navLinks a").forEach(function (link) {

        link.addEventListener("click", function () {

            navLinks.classList.remove("open");

            menuToggle.setAttribute("aria-expanded", "false");

            menuToggle.textContent = "☰";

        });

    });

    // Highlight the selected section in the navigation.

    const sections = document.querySelectorAll(
        "#home, #features, #how-it-works, #about"
    );

    const navigationLinks = document.querySelectorAll("#navLinks a");

    if ("IntersectionObserver" in window) {

        const observer = new IntersectionObserver(function (entries) {

            entries.forEach(function (entry) {

                if (entry.isIntersecting) {

                    navigationLinks.forEach(function (link) {

                        link.classList.toggle(
                            "active",
                            link.getAttribute("href") === "#" + entry.target.id
                        );

                    });

                }

            });

        }, {
            rootMargin: "-20% 0px -65% 0px"
        });

        sections.forEach(function (section) {
            observer.observe(section);
        });

    }
</script>

</body>
</html>