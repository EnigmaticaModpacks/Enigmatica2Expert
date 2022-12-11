/**
 * @file Convert markdown file into CurseForge-compatible HTML
 *
 * @author Krutoy242
 * @link https://github.com/Krutoy242
 */

// @ts-check

import { existsSync, readFileSync, writeFileSync } from 'fs'
import { join, parse } from 'path'

import * as cheerio from 'cheerio'
import MarkdownIt from 'markdown-it'

const sourcePath = String(process.argv[2] || 'latest.md')
if (!existsSync(sourcePath)) throw new Error(`Provide correct file path: ${sourcePath}`)

const md = new MarkdownIt({ html: true })

const $ = cheerio.load(md.render(readFileSync(sourcePath, 'utf8')))

// 𝑪𝒐𝒏𝒗𝒆𝒓𝒕 𝒂𝒍𝒍 𝒊𝒕𝒆𝒎𝒔 𝒊𝒎𝒂𝒈𝒆𝒔 𝒊𝒏𝒕𝒐 𝒋𝒖𝒔𝒕 𝒕𝒆𝒙𝒕
$('img')
  .filter(function () {
    return !!this.attribs.src.match(/https:\/\/is\.gd\/.+/) && !!this.attribs.title
  })
  .each(function () {
    $(this).replaceWith(
      `<strong><span style="font-family: terminal, monaco, monospace;">📦[${$(
        this
      ).attr('title')}]</span></strong>`
    )
  })

// 𝑩𝒆𝒕𝒕𝒆𝒓 𝒉𝒆𝒂𝒅𝒆𝒓𝒔
$('h1').before('<br/>').after('<br/>')
$('h2').before('<br/><hr/>').after('<br/>')
// $('h3').before('<br/>').after('<br/>')
$('h3').wrap('<span style="text-decoration: underline;">').contents().unwrap()
// $('sub').contents().unwrap()
$('sup').remove()

// 𝑷𝒓𝒆𝒇𝒊𝒙𝒆𝒔
$('body').prepend(
  $('<p></p>').append(
    $('<a></a>')
      .attr(
        'href',
        'https://github.com/Krutoy242/Enigmatica2Expert-Extended/issues?q=is%3Aissue+is%3Aopen+sort%3Aupdated-desc+label%3Abug'
      )
      .append('< Known bugs >')
  )
)

$('body').prepend(
  $('<p></p>').append(
    $('<a></a>')
      .attr(
        'href',
        'https://github.com/Krutoy242/Enigmatica2Expert-Extended/releases'
      )
      .append('< Full Changelog with better formatting on GitHub >')
  )
)

// Remove html and body tags
$('html').contents().unwrap()
$('body').replaceWith($('body').contents())
$('head').replaceWith($('head').contents())

const source = parse(sourcePath)
writeFileSync(join(source.dir, `${source.name}.html`), $.html())
