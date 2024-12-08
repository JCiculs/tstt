#include "..\..\YSI_Core\y_utils"
#include "..\..\YSI_Coding\y_va"

// "y_iterate" is always higher than "foreach".
#define _Y_ITERATE_LOCAL_VERSION        43

#if __Pawn != 0x030A
	#define NO_CUSTOM_WARNINGS
#endif

#if !defined _inc_y_iterate
	// The stand-alone version looks for this symbol, even on the new compiler.
	#define _inc_y_iterate
#endif

// Extra macro so that those paranoid about accidentally including YSI can
// ensure it never happens.
#if defined NEVER_Y_ITERATE
	// Set `FOREACH_VERSION` as equal to whatever the version of the stand-alone
	// include is.
	#define FOREACH_VERSION _FOREACH_LOCAL_VERSION
	#undef _inc_y_iterate
	#undef _Y_ITERATE_LOCAL_VERSION
	#if defined _FOREACH_INC_TEST
		// This is `foreach` testing our version - nothing more need doing.
		#endinput
	#endif
	// Otherwise, include `foreach`.  Don't use `#tryinclude`, since they want
	// a version of `foreach` and it would be an error to not give them one.
	#define _FOREACH_NO_TEST
	#include <foreach>
	#endinput
#endif

// Foreach is testing us.
#if defined _FOREACH_INC_TEST
	#if !defined _Y_ITERATE_FOUND
		// Set up so that you can use `FOREACH_VERSION` even if the older
		// stand-alone version doesn't support it.
		#define FOREACH_VERSION _FOREACH_LOCAL_VERSION
		#define _FOREACH_CUR_VERSION _Y_ITERATE_LOCAL_VERSION
	#endif
	#endinput
#endif

#if !defined _FOREACH_NO_TEST
	#define _FOREACH_INC_TEST
	// Ignore the broken stand-alone version.
	#define _foreach_included
	#tryinclude <foreach>
	#undef _FOREACH_INC_TEST
	// <foreach> exists - test which is newer.
	#if defined _FOREACH_LOCAL_VERSION
		#if _FOREACH_LOCAL_VERSION > _Y_ITERATE_LOCAL_VERSION
			// Foreach is newer.
			#if defined _inc_foreach
				#undef _inc_foreach
			#endif
			#define _FOREACH_NO_TEST
			// Actually include the code.
			#include <foreach>
			// Mark the include as found and exit.
			#define FOREACH_VERSION _FOREACH_LOCAL_VERSION
			#define _FOREACH_INC_TEST
			#define _Y_ITERATE_FOUND
			#endinput
		#endif
	#elseif defined foreach && __COMPILER_FIRST_PASS
		// I made this a warning on compilers that supported them, but that's a
		// silly idea!
		#error The old <foreach> include is no longer compatible with YSI.
	#endif
#endif

#define _INC_y_iterate

// Set `FOREACH_VERSION` as this file's version.
#if defined FOREACH_VERSION
	#undef FOREACH_VERSION
#endif

#define FOREACH_VERSION _Y_ITERATE_LOCAL_VERSION
#define _FOREACH_INC_TEST
#define _Y_ITERATE_FOUND

// Remove `_FOREACH_CUR_VERSION` incase someone includes an older version of
// `foreach` later on that doesn't check if this symbol is already defined.
#if defined _FOREACH_CUR_VERSION
	#undef _FOREACH_CUR_VERSION
#endif

#if !defined _samp_included
	#error "Please include a_samp or a_npc before foreach"
#endif

#if defined _YSI_SPECIAL_DEBUG
	#define PS_IS_PLAYER_CONNECTED(%0) (%0 != INVALID_PLAYER_ID)
#else
	#define PS_IS_PLAYER_CONNECTED IsPlayerConnected
#endif

#define INVALID_ITERATOR_SLOT (cellmin)
#define ITER_NONE             (cellmin)

// 
// _FOREACH_BOTS
// 
// Should the "NPC", "Bot", and "Character" iterators be included by default?
// Disabled by declaring "FOREACH_NO_BOTS".
// 

#define _FOREACH_BOTS 0

#if defined IsPlayerNPC
	#define _FOREACH_BOT
	#if !defined FOREACH_NO_BOTS
		#undef _FOREACH_BOTS
		#define _FOREACH_BOTS 1
	#endif
#endif

// 
// _FOREACH_LOCALS
// 
// Should the "LocalActor" and "LocalVehicle" iterators be included?  These only
// loop through ones created by the current script, instead of through ones
// created in any script.
// 

#define _FOREACH_LOCALS 1

#if defined SendChat || defined FOREACH_NO_LOCALS
	#undef _FOREACH_LOCALS
	#define _FOREACH_LOCALS 0
#endif

// 
// _FOREACH_VEHICLES
// 
// Should the "Vehicle" iterator be included?  "Vehicle" loops over all vehicles
// created on the server, "LocalVehicle" iterates over vehicles created only in
// the current script.  They are the same when "YSI_NO_MASTER" is declared.
// Disabled by declaring "FOREACH_NO_VEHICLES".
// 

#define _FOREACH_VEHICLES 1

#if defined SendChat || defined FOREACH_NO_VEHICLES
	#undef _FOREACH_VEHICLES
	#define _FOREACH_VEHICLES 0
#endif

// 
// _FOREACH_ACTORS
// 
// Should the "Actor" iterator be included?  "Actor" loops over all actors
// created on the server, "LocalActor" iterates over actors created only in the
// current script.  They are the same when "YSI_NO_MASTER" is declared.
// Disabled by declaring "FOREACH_NO_ACTORS".
// 

#define _FOREACH_ACTORS 0

#if defined GetActorPos
	#if !defined FOREACH_NO_ACTORS
		#undef _FOREACH_ACTORS
		#define _FOREACH_ACTORS 1
	#endif
#endif

// 
// _FOREACH_PLAYERS
// 
// Should the "Player" iterator be included?  If "_FOREACH_BOTS" is set, the
// "Player" iterator only loops over human players, "NPC" and "Bot" loop over
// computer players, and "Character" loops over them all.  If "_FOREACH_BOTS" is
// not set, then the "Player" iterator loops over every player in the server,
// the same as "Character" would do otherwise, since it has no way to know if a
// player is human or not.  Disabled by declaring "FOREACH_NO_PLAYERS".
// 

#define _FOREACH_PLAYERS 1

#if defined SendChat || defined FOREACH_NO_PLAYERS
	#undef _FOREACH_PLAYERS
	#define _FOREACH_PLAYERS 0
#endif

// 
// _FOREACH_CHARACTERS
// 
// Bot or Player iterators included.
// 

#define _FOREACH_CHARACTERS (_FOREACH_BOTS || _FOREACH_PLAYERS)

// 
// _FOREACH_STREAMED
// 
// Include `Streamed...[playerid]` versions of all the iterators otherwise
// included.
// 

#define _FOREACH_STREAMED 0

#if defined IsPlayerStreamedIn
	#if !defined FOREACH_NO_STREAMED
		#undef _FOREACH_STREAMED
		#define _FOREACH_STREAMED 1
	#endif
#endif

#if !defined BOTSYNC_IS_BOT
	forward Iter_OPDCInternal(playerid);
#endif

#include "y_foreach_macros"

#include "y_foreach_impl"
#include "..\..\YSI_Coding\y_hooks"
#include "y_foreach_yield"

#if _FOREACH_CHARACTERS || _FOREACH_VEHICLES || _FOREACH_ACTORS
	#include "..\..\YSI_Coding\y_hooks"
#endif
#if _FOREACH_VEHICLES || _FOREACH_ACTORS
	#include "..\..\YSI_Coding\y_remote"
#endif
#include "y_foreach_iterators"

#if defined YSI_TESTS
	#include "y_foreach_tests"
#endif

